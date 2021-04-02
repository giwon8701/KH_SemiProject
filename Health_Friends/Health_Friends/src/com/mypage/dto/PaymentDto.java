package com.mypage.dto;

import java.util.Date;

public class PaymentDto {
	private int payment_no;
	private String member_email;
	private int payment_account;
	private Date payment_date;
	public int getPayment_no() {
		return payment_no;
	}
	public void setPayment_no(int payment_no) {
		this.payment_no = payment_no;
	}
	public String getMember_email() {
		return member_email;
	}
	public void setMember_email(String member_email) {
		this.member_email = member_email;
	}
	public int getPayment_account() {
		return payment_account;
	}
	public void setPayment_account(int payment_account) {
		this.payment_account = payment_account;
	}
	public Date getPayment_date() {
		return payment_date;
	}
	public void setPayment_date(Date payment_date) {
		this.payment_date = payment_date;
	}
	public PaymentDto(int payment_no, String member_email, int payment_account, Date payment_date) {
		super();
		this.payment_no = payment_no;
		this.member_email = member_email;
		this.payment_account = payment_account;
		this.payment_date = payment_date;
	}
	public PaymentDto() {
		super();
	}
	

	

}
