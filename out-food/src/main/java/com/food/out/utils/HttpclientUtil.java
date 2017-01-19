/* @{#} HttpclientUtil.java
 * 
 * Woniupay.com Inc.
 * 
 * Copyright (c) 2008-2009 All Rights Reserved. */
package com.food.out.utils;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.URL;
import java.nio.charset.Charset;
import java.nio.charset.CodingErrorAction;
import java.security.KeyManagementException;
import java.security.KeyStore;
import java.security.KeyStoreException;
import java.security.NoSuchAlgorithmException;
import java.security.UnrecoverableKeyException;
import java.security.cert.CertificateException;
import java.security.cert.X509Certificate;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.net.ssl.SSLContext;
import javax.net.ssl.SSLHandshakeException;

import org.apache.commons.io.FileUtils;
import org.apache.commons.lang.StringUtils;
import org.apache.http.Header;
import org.apache.http.HttpEntity;
import org.apache.http.HttpEntityEnclosingRequest;
import org.apache.http.HttpHost;
import org.apache.http.HttpRequest;
import org.apache.http.HttpResponse;
import org.apache.http.NameValuePair;
import org.apache.http.NoHttpResponseException;
import org.apache.http.StatusLine;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.HttpRequestRetryHandler;
import org.apache.http.client.ResponseHandler;
import org.apache.http.client.config.RequestConfig;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.client.methods.HttpRequestBase;
import org.apache.http.config.ConnectionConfig;
import org.apache.http.conn.SchemePortResolver;
import org.apache.http.conn.UnsupportedSchemeException;
import org.apache.http.conn.ssl.SSLConnectionSocketFactory;
import org.apache.http.conn.ssl.SSLContexts;
import org.apache.http.conn.ssl.TrustStrategy;
import org.apache.http.entity.ContentType;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClientBuilder;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.message.BasicNameValuePair;
import org.apache.http.protocol.HttpContext;
import org.apache.http.protocol.HttpCoreContext;
import org.apache.http.util.EntityUtils;
import org.apache.log4j.Logger;

import com.alibaba.fastjson.JSON;
import com.food.out.exception.NetServiceException;


/**
 * Apache Httpclient 4.0 工具包装类
 */
@SuppressWarnings("all")
public class HttpclientUtil {
	public static final Logger log = Logger.getLogger(HttpclientUtil.class);

	private static final String CHARSET_UTF8 = "UTF-8";

	private static final String CHARSET_GBK = "GBK";

	private static final String SSL_DEFAULT_SCHEME = "https";

	private static final int SSL_DEFAULT_PORT = 443;
	
	/**
	 * 调用方法
	 */
//	Map<String, String> params = new HashMap<String, String>();
//	params.put("admin", MenusData.ADMIN);
//	params.put("account", account);
//	params.put("psd", EncryptMD5.getMD5(psd));
//	params.put("syscode", UserApiCons.SYSCODE);
//	String s = HttpclientUtil.get(UserApiCons.APIURL, params);
//	List<MenuPrivilege> list = JSON.parseArray(jpbj.getString("menus"),
//  MenuPrivilege.class);

	// 异常自动恢复处理, 使用HttpRequestRetryHandler接口实现请求的异常恢复
	private static HttpRequestRetryHandler requestRetryHandler = new HttpRequestRetryHandler() {
		// 自定义的恢复策略
		public boolean retryRequest(IOException exception, int executionCount,
		        HttpContext context) {
			// 设置恢复策略，在发生异常时候将自动重试3次
			if (executionCount >= 3) {
				// Do not retry if over max retry count
				return false;
			}
			if (exception instanceof NoHttpResponseException) {
				// Retry if the server dropped connection on us
				return true;
			}
			if (exception instanceof SSLHandshakeException) {
				// Do not retry on SSL handshake exception
				return false;
			}
			HttpRequest request = (HttpRequest) context
			        .getAttribute(HttpCoreContext.HTTP_REQUEST);
			boolean idempotent = (request instanceof HttpEntityEnclosingRequest);
			if (!idempotent) {
				// Retry if the request is considered idempotent
				return true;
			}
			return false;
		}
	};

	// 使用ResponseHandler接口处理响应，HttpClient使用ResponseHandler会自动管理连接的释放，解决了对连接的释放管理
	private static ResponseHandler<String> responseHandler = new ResponseHandler<String>() {
		// 自定义响应处理
		public String handleResponse(HttpResponse response)
		        throws ClientProtocolException, IOException {
			HttpEntity entity = response.getEntity();
			if (entity != null) {
				String charset = (ContentType.get(entity) == null || ContentType
				        .get(entity).getCharset() == null) ? CHARSET_UTF8
				        : ContentType.get(entity).getCharset().toString();
				return EntityUtils.toString(entity, charset);
			} else {
				return null;
			}
		}
	};

	/**
	 * 文件下载
	 * 
	 * @param url
	 *            提交地址
	 * @param params
	 *            查询参数集, 键/值对
	 * @param charset
	 *            参数提交编码集
	 * @return 响应消息
	 */
	public static String downloadFile(String url, Map<String, String> params,
	        String charset, final String contentTypePrefix,
	        final String filePath) {
		if (url == null || StringUtils.isEmpty(url)) {
			return null;
		}
		List<NameValuePair> qparams = getParamsList(params);
		try {
			if (qparams != null && qparams.size() > 0) {
				charset = (charset == null ? CHARSET_UTF8 : charset);
				String formatParams = EntityUtils
				        .toString(new UrlEncodedFormEntity(qparams, charset));
				url = (url.indexOf("?")) < 0 ? (url + "?" + formatParams)
				        : (url.substring(0, url.indexOf("?") + 1) + formatParams);
			}
		} catch (Exception e) {
			throw new NetServiceException("URL生成错误", e);
		}
		CloseableHttpClient httpclient = getDefaultHttpClient(charset);
		HttpGet hg = new HttpGet(url);
		// 发送请求，得到响应
		String responseStr = null;
		try {
			responseStr = httpclient.execute(hg, new ResponseHandler<String>() {
				public String handleResponse(HttpResponse response)
				        throws ClientProtocolException, IOException {
					Header[] heads = response.getHeaders("Content-Type");
					String contentType = "";
					if (null != heads && heads.length > 0) {
						contentType = response.getHeaders("Content-Type")[0]
						        .getValue();
					}
					if (contentType.startsWith(contentTypePrefix)) {
						StatusLine statusLine = response.getStatusLine();
						if (statusLine.getStatusCode() == 200) {
							File file = new File(filePath);
							FileUtils.writeByteArrayToFile(file, EntityUtils
							        .toByteArray(response.getEntity()));
							return "success";
						}
					} else {
						HttpEntity entity = response.getEntity();
						if (entity != null) {
							String charset = (ContentType.get(entity) == null || ContentType
							        .get(entity).getCharset() == null) ? CHARSET_UTF8
							        : ContentType.get(entity).getCharset()
							                .toString();
							return EntityUtils.toString(entity, charset);
						} else {
							return null;
						}
					}
					return null;
				}
			});
		} catch (ClientProtocolException e) {
			throw new NetServiceException("客户端连接协议错误", e);
		} catch (IOException e) {
			throw new NetServiceException("IO操作异常", e);
		} finally {
			abortConnection(hg, httpclient);
		}
		return responseStr;
	}

	/**
	 * 功能描述 : 检测当前URL是否可连接或是否有效, 最多连接网络 5 次, 如果 5 次都不成功说明该地址不存在或视为无效地址.
	 * 
	 * @param url
	 * @return
	 */
	public static synchronized boolean checkUrl(String url) {
		int counts = 0;
		boolean isConnect = false;
		if (url == null || url.length() <= 0) {
			return isConnect;
		}
		while (counts < 5) {
			try {
				URL urlStr = new URL(url);
				HttpURLConnection connection = (HttpURLConnection) urlStr
				        .openConnection();
				int state = connection.getResponseCode();
				if (state == 200) {
					isConnect = true;
				}
				break;
			} catch (Exception ex) {
				counts++;
				continue;
			}
		}
		return isConnect;
	}

	/**
	 * 检测当前URL是否可连接或是否有效
	 * 
	 * @param url
	 * @param params
	 * @param charset
	 * @return
	 */
	public static boolean checkUrl(String url, Map<String, String> params,
	        String charset) {
		try {
			if (url == null || StringUtils.isEmpty(url)) {
				return false;
			}
			List<NameValuePair> qparams = getParamsList(params);
			try {
				if (qparams != null && qparams.size() > 0) {
					charset = (charset == null ? CHARSET_UTF8 : charset);
					String formatParams = EntityUtils
					        .toString(new UrlEncodedFormEntity(qparams, charset));
					url = (url.indexOf("?")) < 0 ? (url + "?" + formatParams)
					        : (url.substring(0, url.indexOf("?") + 1) + formatParams);
				}
			} catch (Exception e) {
				return false;
			}
			RequestConfig config = RequestConfig.custom()
			        .setConnectTimeout(1000).setSocketTimeout(1000)
			        .setConnectionRequestTimeout(1000)
			        .setRedirectsEnabled(false)
			        .setRelativeRedirectsAllowed(true)
			        .setCircularRedirectsAllowed(true)
			        .setExpectContinueEnabled(false).build();
			ConnectionConfig connectionConfig = ConnectionConfig.custom()
			        .setMalformedInputAction(CodingErrorAction.IGNORE)
			        .setUnmappableInputAction(CodingErrorAction.IGNORE)
			        .setCharset(Charset.forName(charset)).build();
			HttpClientBuilder httpClientBuilder = HttpClients
			        .custom()
			        .create()
			        .setDefaultConnectionConfig(connectionConfig)
			        .setUserAgent(
			                "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/35.0.1916.153 Safari/537.36")
			        .setDefaultRequestConfig(config);
			CloseableHttpClient httpclient = httpClientBuilder.build();
			HttpGet hg = new HttpGet(url);
			// 发送请求，得到响应
			String responseStr = null;
			try {
				responseStr = httpclient.execute(hg,
				        new ResponseHandler<String>() {
					        public String handleResponse(HttpResponse response)
					                throws ClientProtocolException, IOException {
						        return String.valueOf(response.getStatusLine()
						                .getStatusCode());
					        }
				        });
			} catch (ClientProtocolException e) {
				return false;
			} catch (IOException e) {
				return false;
			} finally {
				abortConnection(hg, httpclient);
			}
			if ("200".equals(responseStr)) {
				return true;
			}
		} catch (Exception e) {
			return false;
		}
		return false;
	}

	/**
	 * Get方式提交,URL中包含查询参数, 格式：http://www.g.cn?search=p&name=s.....
	 * 
	 * @param url
	 *            提交地址
	 * @return 响应消息
	 */
	public static String get(String url) {
		return get(url, null, null);
	}

	/**
	 * Get方式提交,URL中不包含查询参数, 格式：http://www.g.cn
	 * 
	 * @param url
	 *            提交地址
	 * @param params
	 *            查询参数集, 键/值对
	 * @return 响应消息
	 */
	public static String get(String url, Map<String, String> params) {
		return get(url, params, null);
	}

	/**
	 * Get方式提交,URL中不包含查询参数, 格式：http://www.g.cn
	 * 
	 * @param url
	 *            提交地址
	 * @param params
	 *            查询参数集, 键/值对
	 * @param charset
	 *            参数提交编码集
	 * @return 响应消息
	 */
	public static String get(String url, Map<String, String> params,
	        String charset) {
		if (url == null || StringUtils.isEmpty(url)) {
			return null;
		}
		List<NameValuePair> qparams = getParamsList(params);
		try {
			if (qparams != null && qparams.size() > 0) {
				charset = (charset == null ? CHARSET_UTF8 : charset);
				String formatParams = EntityUtils
				        .toString(new UrlEncodedFormEntity(qparams, charset));
				url = (url.indexOf("?")) < 0 ? (url + "?" + formatParams)
				        : (url.substring(0, url.indexOf("?") + 1) + formatParams);
			}
		} catch (Exception e) {
			throw new NetServiceException("URL生成错误", e);
		}
		CloseableHttpClient httpclient = getDefaultHttpClient(charset);
		HttpGet hg = new HttpGet(url);
		// 发送请求，得到响应
		String responseStr = null;
		try {
			responseStr = httpclient.execute(hg, responseHandler);
		} catch (ClientProtocolException e) {
			throw new NetServiceException("客户端连接协议错误", e);
		} catch (IOException e) {
			throw new NetServiceException("IO操作异常", e);
		} finally {
			abortConnection(hg, httpclient);
		}
		return responseStr;
	}

	/**
	 * Post方式提交,URL中不包含提交参数, 格式：http://www.g.cn
	 * 
	 * @param url
	 *            提交地址
	 * @param params
	 *            提交参数集, 键/值对
	 * @return 响应消息
	 */
	public static String post(String url, Map<String, String> params) {
		return post(url, params, null);
	}

	/**
	 * Post方式提交,URL中不包含提交参数, 格式：http://www.g.cn
	 * 
	 * @param url
	 *            提交地址
	 * @param params
	 *            提交参数集, 键/值对
	 * @param charset
	 *            参数提交编码集
	 * @return 响应消息
	 */
	public static String post(String url, Map<String, String> params,
	        String charset) {
		if (url == null || StringUtils.isEmpty(url)) {
			return null;
		}
		// 创建HttpClient实例
		CloseableHttpClient httpclient = getDefaultHttpClient(charset);
		UrlEncodedFormEntity formEntity = null;
		try {
			if (charset == null || StringUtils.isEmpty(charset)) {
				formEntity = new UrlEncodedFormEntity(getParamsList(params));
			} else {
				formEntity = new UrlEncodedFormEntity(getParamsList(params),
				        charset);
			}
		} catch (UnsupportedEncodingException e) {
			log.info("不支持的编码集" + e);
			throw new NetServiceException("不支持的编码集", e);
		}
		HttpPost hp = new HttpPost(url);
		hp.setEntity(formEntity);
		// 发送请求，得到响应
		String responseStr = null;
		try {
			responseStr = httpclient.execute(hp, responseHandler);
		} catch (ClientProtocolException e) {
			log.info("客户端连接协议错误" + e);
			throw new NetServiceException("客户端连接协议错误", e);
		} catch (IOException e) {
			log.info("IO操作异常" + e);
			throw new NetServiceException("IO操作异常", e);
		} finally {
			abortConnection(hp, httpclient);
		}
		return responseStr;
	}

	/**
	 * Post方式提交,忽略URL中包含的参数,解决SSL双向数字证书认证
	 * 
	 * @param url
	 *            提交地址
	 * @param params
	 *            提交参数集, 键/值对
	 * @param charset
	 *            参数编码集
	 * @param keystoreUrl
	 *            密钥存储库路径
	 * @param keystorePassword
	 *            密钥存储库访问密码
	 * @param truststoreUrl
	 *            信任存储库绝路径
	 * @param truststorePassword
	 *            信任存储库访问密码, 可为null
	 * @return 响应消息
	 * @throws NetServiceException
	 */
	public static String post(String url, Map<String, String> params,
	        String charset, final URL keystoreUrl,
	        final String keystorePassword, final URL truststoreUrl,
	        final String truststorePassword) {
		if (url == null || StringUtils.isEmpty(url)) {
			return null;
		}
		HttpClientBuilder httpClientBuilder = getDefaultHttpClientBuilder(charset);
		CloseableHttpClient httpclient = null;
		UrlEncodedFormEntity formEntity = null;
		try {
			if (charset == null || StringUtils.isEmpty(charset)) {
				formEntity = new UrlEncodedFormEntity(getParamsList(params));
			} else {
				formEntity = new UrlEncodedFormEntity(getParamsList(params),
				        charset);
			}
		} catch (UnsupportedEncodingException e) {
			throw new NetServiceException("不支持的编码集", e);
		}
		HttpPost hp = null;
		String responseStr = null;
		try {
			KeyStore keyStore = createKeyStore(keystoreUrl, keystorePassword);
			KeyStore trustStore = createKeyStore(truststoreUrl,
			        truststorePassword);
			SSLContext sslContext = SSLContexts.custom()
			        .loadKeyMaterial(keyStore, keystorePassword.toCharArray())
			        .loadTrustMaterial(trustStore).build();
			SSLConnectionSocketFactory socketFactory = new SSLConnectionSocketFactory(
			        sslContext,
			        SSLConnectionSocketFactory.BROWSER_COMPATIBLE_HOSTNAME_VERIFIER);
			httpclient = httpClientBuilder.setSSLSocketFactory(socketFactory)
			        .setSchemePortResolver(new SchemePortResolver() {
				        public int resolve(HttpHost httphost)
				                throws UnsupportedSchemeException {
					        return SSL_DEFAULT_PORT;
				        }
			        }).build();
			hp = new HttpPost(url);
			hp.setEntity(formEntity);
			responseStr = httpclient.execute(hp, responseHandler);
		} catch (NoSuchAlgorithmException e) {
			throw new NetServiceException("指定的加密算法不可用", e);
		} catch (KeyStoreException e) {
			throw new NetServiceException("keytore解析异常", e);
		} catch (CertificateException e) {
			throw new NetServiceException("信任证书过期或解析异常", e);
		} catch (FileNotFoundException e) {
			throw new NetServiceException("keystore文件不存在", e);
		} catch (IOException e) {
			throw new NetServiceException("I/O操作失败或中断  ", e);
		} catch (UnrecoverableKeyException e) {
			throw new NetServiceException("keystore中的密钥无法恢复异常", e);
		} catch (KeyManagementException e) {
			throw new NetServiceException("处理密钥管理的操作异常", e);
		} finally {
			abortConnection(hp, httpclient);
		}
		return responseStr;
	}

	/**
	 * ssl 忽略证书 request
	 * 
	 * @param url
	 * @param param
	 * @param charset
	 * @return
	 */
	public static String post(String url, String param, String charset) {
		if (url == null || StringUtils.isEmpty(url)) {
			return null;
		}
		HttpClientBuilder httpClientBuilder = getDefaultHttpClientBuilder(charset);
		CloseableHttpClient httpclient = null;
		StringEntity stringEntity = null;
		try {
			if (charset == null || StringUtils.isEmpty(charset)) {
				stringEntity = new StringEntity(param);
			} else {
				stringEntity = new StringEntity(param, charset);
			}
		} catch (UnsupportedEncodingException e) {
			throw new NetServiceException("不支持的编码集", e);
		}
		HttpPost hp = null;
		String responseStr = null;
		try {
			KeyStore keyStore = KeyStore.getInstance(KeyStore.getDefaultType());
			SSLContext sslContext = SSLContexts.custom().useTLS()
			        .loadTrustMaterial(keyStore, new TrustStrategy() {
				        public boolean isTrusted(
				                X509Certificate[] paramArrayOfX509Certificate,
				                String paramString) throws CertificateException {
					        return true;
				        }
			        }).build();
			SSLConnectionSocketFactory socketFactory = new SSLConnectionSocketFactory(
			        sslContext,
			        SSLConnectionSocketFactory.ALLOW_ALL_HOSTNAME_VERIFIER);
			httpclient = httpClientBuilder.setSSLSocketFactory(socketFactory)
			        .build();
			hp = new HttpPost(url);
			hp.setEntity(stringEntity);
			responseStr = httpclient.execute(hp, responseHandler);
		} catch (Exception e) {
			throw new NetServiceException("SSL请求异常", e);
		} finally {
			abortConnection(hp, httpclient);
		}
		return responseStr;
	}

	/**
	 * 获取DefaultHttpClient实例
	 * 
	 * @param charset
	 *            参数编码集, 可空
	 * @return DefaultHttpClient 对象
	 */
	private static CloseableHttpClient getDefaultHttpClient(final String charset) {
		HttpClientBuilder httpClientBuilder = getDefaultHttpClientBuilder(charset);
		return httpClientBuilder.build();
	}

	private static HttpClientBuilder getDefaultHttpClientBuilder(
	        final String charset) {
		RequestConfig config = RequestConfig.custom().setConnectTimeout(60000)
		        .setSocketTimeout(60000).setConnectionRequestTimeout(60000)
		        .setRedirectsEnabled(true).setRelativeRedirectsAllowed(true)
		        .setCircularRedirectsAllowed(true)
		        .setExpectContinueEnabled(false).build();
		ConnectionConfig connectionConfig = ConnectionConfig.custom()
		        .setMalformedInputAction(CodingErrorAction.IGNORE)
		        .setUnmappableInputAction(CodingErrorAction.IGNORE)
		        .setCharset(Charset.forName(charset)).build();
		return HttpClients
		        .custom()
		        .create()
		        .setRetryHandler(requestRetryHandler)
		        .setDefaultConnectionConfig(connectionConfig)
		        .setUserAgent(
		                "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/35.0.1916.153 Safari/537.36")
		        .setDefaultRequestConfig(config);
	}

	/**
	 * 释放HttpClient连接
	 * 
	 * @param hrb
	 *            请求对象
	 * @param httpclient
	 *            client对象
	 */
	private static void abortConnection(final HttpRequestBase hrb,
	        final CloseableHttpClient httpclient) {
		if (hrb != null) {
			hrb.abort();
		}
		if (httpclient != null) {
			try {
				httpclient.close();
			} catch (IOException e) {
				throw new NetServiceException("I/O操作失败或中断  ", e);
			}
		}
	}

	/**
	 * 从给定的路径中加载此 KeyStore
	 * 
	 * @param url
	 *            keystore URL路径
	 * @param password
	 *            keystore访问密钥
	 * @return keystore 对象
	 */
	private static KeyStore createKeyStore(final URL url, final String password)
	        throws KeyStoreException, NoSuchAlgorithmException,
	        CertificateException, IOException {
		if (url == null) {
			throw new IllegalArgumentException("Keystore url may not be null");
		}
		KeyStore keystore = KeyStore.getInstance(KeyStore.getDefaultType());
		InputStream is = null;
		try {
			is = url.openStream();
			keystore.load(is, password != null ? password.toCharArray() : null);
		} finally {
			if (is != null) {
				is.close();
				is = null;
			}
		}
		return keystore;
	}

	/**
	 * 将传入的键/值对参数转换为NameValuePair参数集
	 * 
	 * @param paramsMap
	 *            参数集, 键/值对
	 * @return NameValuePair参数集
	 */
	private static List<NameValuePair> getParamsList(
	        Map<String, String> paramsMap) {
		if (paramsMap == null || paramsMap.size() == 0) {
			return null;
		}
		List<NameValuePair> params = new ArrayList<NameValuePair>();
		for (Map.Entry<String, String> map : paramsMap.entrySet()) {
			params.add(new BasicNameValuePair(map.getKey(), map.getValue()));
		}
		return params;
	}

	public static void main(String[] args) {
		System.out
		        .println(HttpclientUtil
		                .checkUrl(
		                        "http://wx.qlogo.cn/mmopen/qVCYFE0dCHocv1OhpUvCrdjxOib5lvvQCdu7It6Ym2S9gKSrwtD6jhKsqls7Jv2h93tYtPHYZEX9S4M3GypXt6Q4K10IGFmnC/0",
		                        null, "utf-8"));
	}
}
