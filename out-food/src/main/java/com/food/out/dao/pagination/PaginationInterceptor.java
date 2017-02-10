package com.food.out.dao.pagination;

import java.lang.reflect.Field;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Properties;

import org.apache.ibatis.executor.parameter.ParameterHandler;
import org.apache.ibatis.executor.statement.RoutingStatementHandler;
import org.apache.ibatis.executor.statement.StatementHandler;
import org.apache.ibatis.mapping.BoundSql;
import org.apache.ibatis.mapping.MappedStatement;
import org.apache.ibatis.mapping.ParameterMapping;
import org.apache.ibatis.plugin.Interceptor;
import org.apache.ibatis.plugin.Intercepts;
import org.apache.ibatis.plugin.Invocation;
import org.apache.ibatis.plugin.Plugin;
import org.apache.ibatis.plugin.Signature;
import org.apache.ibatis.reflection.MetaObject;
import org.apache.ibatis.reflection.SystemMetaObject;
import org.apache.ibatis.scripting.defaults.DefaultParameterHandler;
import org.apache.ibatis.session.Configuration;
import org.apache.log4j.Logger;

import com.xianguo.platform.model.PageInfo;

@Intercepts({@Signature(type=StatementHandler.class,method="prepare",args={Connection.class})})
public class PaginationInterceptor implements Interceptor{
	private final static Logger log = Logger.getLogger(PaginationInterceptor.class);
	private String defaultDialect = "mysql";
	private String defaultPageFuncRegular = ".*ByPage$";
	
	public Object intercept(Invocation invocation) throws Throwable {
		 //* 对于StatementHandler其实只有两个实现类，一个是RoutingStatementHandler，另一个是抽象类BaseStatementHandler
		 //* BaseStatementHandler有三个子类，分别是SimpleStatementHandler，PreparedStatementHandler和CallableStatementHandler
		 //* SimpleStatementHandler是用于处理Statement的，
		 //* PreparedStatementHandler是处理PreparedStatement的，
		 //* 而CallableStatementHandler是处理CallableStatement的
		 //* Mybatis在进行Sql语句处理的时候都是建立的RoutingStatementHandler，
		 //* 而在RoutingStatementHandler里面拥有一个StatementHandler类型的delegate属性，
		 //* RoutingStatementHandler会依据Statement的不同建立对应的BaseStatementHandler，
		 //* 即SimpleStatementHandler、PreparedStatementHandler或CallableStatementHandler，
		 //* 在RoutingStatementHandler里面所有StatementHandler接口方法的实现都是调用的delegate对应的方法
		 //* 我们在PageInterceptor类上已经用@Signature标记了该Interceptor只拦截StatementHandler接口的prepare方法，
		 //* 又因为Mybatis只有在建立RoutingStatementHandler的时候是通过Interceptor的plugin方法进行包裹的，
		 //* 所以我们这里拦截到的目标对象肯定是RoutingStatementHandler对象
		RoutingStatementHandler handler = (RoutingStatementHandler) invocation.getTarget();
		MetaObject metaStatementHandler = SystemMetaObject.forObject(handler);
		Configuration configuration = (Configuration) metaStatementHandler.getValue("delegate.configuration");
		String databaseType = null;
		String pageFuncRegular = null;
		try {
			databaseType = configuration.getVariables().getProperty("dialect");
			pageFuncRegular = configuration.getVariables().getProperty("pageFuncRegular");
		} catch (Exception e) {
			// ignore
		}
		if (null == databaseType || "".equals(databaseType)) { 
			log.warn("Property dialect is not setted,use default 'mysql' "); 
			databaseType = defaultDialect;
		}
		if (null == pageFuncRegular || "".equals(pageFuncRegular)) {  
			log.warn("Property pageFuncRegular is not setted,use default '.*Page$' ");
			pageFuncRegular = defaultPageFuncRegular;
		}
		MappedStatement mappedStatement = (MappedStatement)metaStatementHandler.getValue("delegate.mappedStatement");  
		//判断是否需要分页 只重写需要分页的sql语句。通过MappedStatement的ID匹配，默认重写以Page结尾的
		if(mappedStatement.getId().matches(pageFuncRegular)){
			//获取delegate属性
			StatementHandler delegate = (StatementHandler)metaStatementHandler.getValue("delegate");
			//获取到当前StatementHandler的 boundSql，这里不管是调用handler.getBoundSql()还是直接调用delegate.getBoundSql()结果是一样的
			//因为之前已经说过了RoutingStatementHandler实现的所有StatementHandler接口方法里面都是调用的delegate对应的方法。
			BoundSql boundSql = delegate.getBoundSql();
			//拿到当前绑定Sql的参数对象，就是我们在调用对应的Mapper映射语句时所传入的参数对象
			Object parameterObject = boundSql.getParameterObject();
			//方法参数必须为Page类型
			if (parameterObject instanceof PageInfo) {
				PageInfo pageInfo = (PageInfo) parameterObject;
				//拦截到的prepare方法参数是一个Connection对象
				Connection connection = (Connection)invocation.getArgs()[0];
				//获取当前要执行的Sql语句，也就是我们直接在Mapper映射语句中写的Sql语句
				String sql = boundSql.getSql();
				if(pageInfo.getTotalRecord()<=0){
					//给当前的page参数对象设置总记录数
					this.setTotalRecord(parameterObject, pageInfo, mappedStatement, connection);  
				}
				//获取分页Sql语句
				String pageSql = this.getPageSql(pageInfo, sql , databaseType);
				//利用反射设置当前BoundSql对应的sql属性为我们建立好的分页Sql语句
				ReflectUtil.setFieldValue(boundSql, "sql", pageSql);
			}else if(parameterObject instanceof Map){
				Map parameterMap = (Map)parameterObject;
				Iterator<String> iterator = parameterMap.keySet().iterator();
				PageInfo pageInfo = null;
				while (iterator.hasNext()) {
					String key = iterator.next();
					Object obj = parameterMap.get(key);
					if(obj instanceof PageInfo){
						pageInfo = (PageInfo)obj;
						break;
					}
				}
				if(pageInfo != null){
					//拦截到的prepare方法参数是一个Connection对象
					Connection connection = (Connection)invocation.getArgs()[0];
					//获取当前要执行的Sql语句，也就是我们直接在Mapper映射语句中写的Sql语句
					String sql = boundSql.getSql();
					if(pageInfo.getTotalRecord()<=0){
						//给当前的page参数对象设置总记录数
						this.setTotalRecord(parameterObject, pageInfo, mappedStatement, connection);  
					}
					//获取分页Sql语句
					String pageSql = this.getPageSql(pageInfo, sql , databaseType);
					//利用反射设置当前BoundSql对应的sql属性为我们建立好的分页Sql语句
					ReflectUtil.setFieldValue(boundSql, "sql", pageSql);
				}
			}
		}
		return invocation.proceed();
	}

	/**
	 * 拦截器对应的封装原始对象的方法 
	 */
	public Object plugin(Object target) {
		//当目标类是StatementHandler类型时，才包装目标类，否者直接返回目标本身,减少目标被代理的次数
		if (target instanceof StatementHandler) {
			return Plugin.wrap(target, this);
		}else{
			return target;
		}
	}

	public void setProperties(Properties properties) {
		
	}
	
    /** 
     * 根据page对象获取对应的分页查询Sql语句，这里只做了两种数据库类型，Mysql和Oracle 
     * 其它的数据库都 没有进行分页 
     * 
     * @param page 分页对象 
     * @param sql 原sql语句 
     * @return 
     */  
    private String getPageSql(PageInfo pageInfo, String sql ,String databaseType) {  
       StringBuffer sqlBuffer = new StringBuffer(sql);  
       if ("mysql".equalsIgnoreCase(databaseType)) {  
           return getMysqlPageSql(pageInfo, sqlBuffer);  
       } else if ("oracle".equalsIgnoreCase(databaseType)) {  
           return getOraclePageSql(pageInfo, sqlBuffer);  
       }  
       return sqlBuffer.toString();  
    }  

    /** 
     * 获取Mysql数据库的分页查询语句 
     * @param page 分页对象 
     * @param sqlBuffer 包含原sql语句的StringBuffer对象 
     * @return Mysql数据库分页语句 
     */  
    private String getMysqlPageSql(PageInfo pageInfo, StringBuffer sqlBuffer) {  
       //计算第一条记录的位置，Mysql中记录的位置是从0开始的。  
       int offset = (pageInfo.getPageNo() - 1) * pageInfo.getPageSize();  
       sqlBuffer.append(" limit ").append(offset).append(",").append(pageInfo.getPageSize());  
       return sqlBuffer.toString();  
    }

    /** 
     * 获取Oracle数据库的分页查询语句 
     * @param page 分页对象 
     * @param sqlBuffer 包含原sql语句的StringBuffer对象 
     * @return Oracle数据库的分页查询语句 
     */  
    private String getOraclePageSql(PageInfo pageInfo, StringBuffer sqlBuffer) {  
        //计算第一条记录的位置，Oracle分页是通过rownum进行的，而rownum是从1开始的  
        int offset = (pageInfo.getPageNo() - 1) * pageInfo.getPageSize() + 1;  
		StringBuffer pagingSelect = new StringBuffer(sqlBuffer.length() + 100);
		pagingSelect.append("select * from ( select row_.*, rownum rownum_ from ( ");
		pagingSelect.append(sqlBuffer.toString());
		pagingSelect.append(" ) row_ ) where rownum_ > ").append(offset).append(" and rownum_ <= ").append(offset + pageInfo.getPageSize());
    	
       return pagingSelect.toString();  
    }

	
	/**
	 * 给当前的参数对象page设置总记录数
	 * 
	 * @param page
	 *            Mapper映射语句对应的参数对象
	 * @param mappedStatement
	 *            Mapper映射语句
	 * @param connection
	 *            当前的数据库连接
	 */
	@SuppressWarnings("unchecked")
	private void setTotalRecord(Object parameterObject, PageInfo pageInfo, MappedStatement mappedStatement, Connection connection) {
		// 获取对应的BoundSql，这个BoundSql其实跟我们利用StatementHandler获取到的BoundSql是同一个对象。
		// delegate里面的boundSql也是通过mappedStatement.getBoundSql(paramObj)方法获取到的。
		BoundSql boundSql = mappedStatement.getBoundSql(parameterObject);
		// 获取到我们自己写在Mapper映射语句中对应的Sql语句
		String sql = boundSql.getSql();
		// 通过查询Sql语句获取到对应的计算总记录数的sql语句
		String countSql = this.getCountSql(sql);
		// 通过BoundSql获取对应的参数映射
//		List<ParameterMapping> parameterMappings = boundSql.getParameterMappings();
		// 利用Configuration、查询记录数的Sql语句countSql、参数映射关系parameterMappings和参数对象parameterObject建立查询记录数对应的BoundSql对象。
//		BoundSql countBoundSql = new BoundSql(mappedStatement.getConfiguration(), countSql, parameterMappings, parameterObject);
//		MetaObject metaObject = SystemMetaObject.forObject(boundSql);
//		Map<Object, Object> parametersMap = new HashMap<Object, Object>();
//		parametersMap.putAll((Map<Object, Object>)metaObject.getValue("additionalParameters"));
//		parametersMap.putAll((Map<Object, Object>)parameterObject);
		// 通过mappedStatement、参数对象parameterObject和BoundSql对象countBoundSql建立一个用于设定参数的ParameterHandler对象
		ParameterHandler parameterHandler = new DefaultParameterHandler(mappedStatement, parameterObject, boundSql);
		//利用反射设置当前BoundSql对应的sql属性为我们建立好的分页Sql语句
		ReflectUtil.setFieldValue(boundSql, "sql", countSql);
		// 通过connection建立一个countSql对应的PreparedStatement对象。
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			pstmt = connection.prepareStatement(countSql);
			// 通过parameterHandler给PreparedStatement对象设置参数
			parameterHandler.setParameters(pstmt);
			
			// 之后就是执行获取总记录数的Sql语句和获取结果了。
			rs = pstmt.executeQuery();
			if (rs.next()) {
				int totalRecord = rs.getInt(1);
				// 给当前的参数pageInfo对象设置总记录数
				pageInfo.setTotalRecord(totalRecord);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}

	/**
	 * 根据原Sql语句获取对应的查询总记录数的Sql语句
	 * @param sql
	 * @return
	 */
	private String getCountSql(String sql) {
		return "select count(*) from ("+sql+") as total";
	}

	/**
	 * 利用反射进行操作的一个工具类
	 * 
	 */
	private static class ReflectUtil {
		/**
		 * 利用反射获取指定对象的指定属性
		 * 
		 * @param obj
		 *            目标对象
		 * @param fieldName
		 *            目标属性
		 * @return 目标属性的值
		 */
		public static Object getFieldValue(Object obj, String fieldName) {
			Object result = null;
			Field field = ReflectUtil.getField(obj, fieldName);
			if (field != null) {
				field.setAccessible(true);
				try {
					result = field.get(obj);
				} catch (IllegalArgumentException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (IllegalAccessException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			return result;
		}

		/**
		 * 利用反射获取指定对象里面的指定属性
		 * 
		 * @param obj
		 *            目标对象
		 * @param fieldName
		 *            目标属性
		 * @return 目标字段
		 */
		private static Field getField(Object obj, String fieldName) {
			Field field = null;
			for (Class<?> clazz = obj.getClass(); clazz != Object.class; clazz = clazz.getSuperclass()) {
				try {
					field = clazz.getDeclaredField(fieldName);
					break;
				} catch (NoSuchFieldException e) {
					// 这里不用做处理，子类没有该字段可能对应的父类有，都没有就返回null。
				}
			}
			return field;
		}

		/**
		 * 利用反射设置指定对象的指定属性为指定的值
		 * 
		 * @param obj
		 *            目标对象
		 * @param fieldName
		 *            目标属性
		 * @param fieldValue
		 *            目标值
		 */
		public static void setFieldValue(Object obj, String fieldName,String fieldValue) {
			Field field = ReflectUtil.getField(obj, fieldName);
			if (field != null) {
				try {
					field.setAccessible(true);
					field.set(obj, fieldValue);
				} catch (IllegalArgumentException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (IllegalAccessException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}
	}

}
