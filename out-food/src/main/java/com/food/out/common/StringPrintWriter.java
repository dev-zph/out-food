package com.food.out.common;

import java.io.PrintWriter;
import java.io.StringWriter;

/**
 * 
 * @author liuwei3
 *
 */
public class StringPrintWriter extends PrintWriter
{
	public StringPrintWriter()
	{
		super(new StringWriter());
	}

	public StringPrintWriter(int initialSize)
	{
		super(new StringWriter(initialSize));
	}

	public String getString()
	{
		return ((StringWriter) this.out).toString();
	}

	@Override
	public String toString()
	{
		return getString();
	}
}
