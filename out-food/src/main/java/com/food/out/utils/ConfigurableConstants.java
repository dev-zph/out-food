package com.food.out.utils;

import org.springframework.util.Assert;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;

/**
 * Constants base class, all value read from config file.
 * Sub-class should put blow code at first, example:
 * <pre>
 * static {
 *      init("conf/aggr.properties");
 * }
 * </pre>
 *
 * @author akazam
 */
public abstract class ConfigurableConstants 
{
    private static Properties p = new Properties();
    public static final String Blank = "null";
    private static final Log logger = LogFactory.getLog(ConfigurableConstants.class);

    /**
     * read config file and set vlaue to Properties p
     * @param propertyFileName file name
     */
    protected static void init(String propertyFileName) 
    {
        Assert.hasText("property file name can't be null for configurable constants");

        InputStream in = null;
        try 
        {
            in = ConfigurableConstants.class.getClassLoader().getResourceAsStream(propertyFileName);
            if (in != null) p.load(in);
        } 
        catch (IOException e) 
        {
            logger.error("load " + propertyFileName + " into Constants error!", e);
        }
        finally 
        {
            if (in != null) 
            {
                try 
                {
                    in.close();
                } 
                catch (IOException e)
                {
                    logger.error("close " + propertyFileName + " error!", e);
                }
            }
        }
    }

    /**
     * @param key property key
     * @return property value
     */
    public static String getValue(String key)
    {
        String value = p.getProperty(key);
        if(value == null) 
        {
            logger.warn("'" + key + "' not found!");
        }
        return value;
    }

    /**
     * @param key property key
     * @param defaultValue if property value isn't exist, use default value
     * @return property value
     */
    protected static String getValue(String key, String defaultValue)
    {
        return p.getProperty(key, defaultValue);
    }

    /**
     * @param key property key
     * @return int value. if value isn't exist, return 0
     */
    protected static int getIntValue(String key)
    {
        return getIntValue(key, 0);
    }

    /**
     * @param key property key
     * @param defaultValue if property value isn't exist, use default value
     * @return int value
     */
    protected static int getIntValue(String key, int defaultValue) 
    {
        String value = getValue(key);

        return value == null ? defaultValue : Integer.parseInt(value);
    }

    /**
     * @param key property key
     * @return  boolean value. if value isn't exist, return false
     */
    protected static boolean getBoolValue(String key)
    {
        return getBoolValue(key, false);
    }

    /**
     * @param key  property key
     * @param defaultValue  defaultValue if property value isn't exist, use default value
     * @return boolean value
     */
    protected static boolean getBoolValue(String key, boolean defaultValue) 
    {
        String value = getValue(key);
        return value == null ? defaultValue : "true".equals(value);
    }
}