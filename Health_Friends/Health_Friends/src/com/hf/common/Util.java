package com.hf.common;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.List;

import com.hf.dto.CalDto;

public class Util {
	
	private String todates;
	
	public String getTodates() {
		return todates;
	}
	public void setTodates(String mdate) {
		// yyyy-MM-dd hh:mm:00 형태로 바꾸자.
		String temp = mdate.substring(0, 4) + "-"
				    + mdate.substring(4, 6) + "-"
				    + mdate.substring(6, 8) + " "
				    + mdate.substring(8, 10) + ":"
				    + mdate.substring(10) + ":00";
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy년 MM월 dd일 HH시mm분");
		Timestamp tm = Timestamp.valueOf(temp);
		todates = sdf.format(tm);
	}

	
	// 토요일, 일요일, 평일 색상
	public static String fontColor(int date, int dayOfWeek) {
		String color = "";
		
		if((dayOfWeek -1 + date)%7 == 0) {
			color = "blue";
		} else if((dayOfWeek -1 + date)%7 == 1) {
			color = "red";
		} else {
			color = "black";
		}
		
		
		return color;
	}
	
	// 일정의 한자리수->두자리수 변환
	public static String isTwo(String msg) {
		return (msg.length()<2)? "0"+msg : msg;
	}
	
	// 일정 제목이 긴 경우, 뒷부분을 ...으로
	public static String getCalView(int i, List<CalDto> list) {
		String d = isTwo(i+"");
		String res = "";
		
		for(CalDto dto : list) {
			if(dto.getMdate().substring(6, 8).equals(d)) {
				res += "<p>"
					 + ((dto.getTitle().length() > 6) ? dto.getTitle().substring(0, 6) + "..." : dto.getTitle())
					 + "</p>";
			}
		}
		return res;
	}
}
