package com.google.appengine;

import java.io.IOException;

import javax.servlet.ServletException;

import org.junit.Assert;
import org.junit.Test;

public class HelloAppEngineTest {

  @Test
  public void test() throws IOException, ServletException {
    MockHttpServletResponse response = null;
	try {
		response = new MockHttpServletResponse();
	} catch (Exception e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
    new HelloAppEngine().doPost(null, response);
    Assert.assertEquals("text/plain", response.getContentType());
    Assert.assertEquals("UTF-8", response.getCharacterEncoding());
    Assert.assertEquals("Hello App Engine!\r\n", response.getWriterContent().toString());
  }
}
