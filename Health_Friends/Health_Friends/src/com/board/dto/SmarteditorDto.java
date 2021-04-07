package com.board.dto;

import com.oreilly.servlet.MultipartRequest;

public class SmarteditorDto {
	private MultipartRequest filedata;
	private String callback;
	private String callback_func;
	
	public SmarteditorDto() {
		
	}

	public SmarteditorDto(MultipartRequest filedata, String callback, String callback_func) {
		this.filedata = filedata;
		this.callback = callback;
		this.callback_func = callback_func;
	}

	public MultipartRequest getFiledata() {
		return filedata;
	}

	public void setFiledata(MultipartRequest filedata) {
		this.filedata = filedata;
	}

	public String getCallback() {
		return callback;
	}

	public void setCallback(String callback) {
		this.callback = callback;
	}

	public String getCallback_func() {
		return callback_func;
	}

	public void setCallback_func(String callback_func) {
		this.callback_func = callback_func;
	}
	
	
}
