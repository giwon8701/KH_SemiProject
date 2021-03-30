package com.mypage.dto;

import java.util.Date;

public class PaymentDto {
	private int payment_no;
	private String member_id;
	private int payment_acount;
	private Date payment_date;
	public int getPayment_no() {
		return payment_no;
	}
	public void setPayment_no(int payment_no) {
		this.payment_no = payment_no;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public int getPayment_acount() {
		return payment_acount;
	}
	public void setPayment_acount(int payment_acount) {
		this.payment_acount = payment_acount;
	}
	public Date getPayment_date() {
		return payment_date;
	}
	public void setPayment_date(Date payment_date) {
		this.payment_date = payment_date;
	}
	public PaymentDto(int payment_no, String member_id, int payment_acount, Date payment_date) {
		super();
		this.payment_no = payment_no;
		this.member_id = member_id;
		this.payment_acount = payment_acount;
		this.payment_date = payment_date;
	}
	public PaymentDto() {
		super();
	}
	
	

}
