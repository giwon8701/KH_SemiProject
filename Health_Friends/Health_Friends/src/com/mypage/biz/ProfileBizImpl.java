package com.mypage.biz;

import com.login.dto.RegistDto;
import com.mypage.dao.ProfileDao;
import com.mypage.dao.ProfileDaoImpl;

public class ProfileBizImpl implements ProfileBiz {

	ProfileDao dao = new ProfileDaoImpl();
	
	public int profileUpdate(RegistDto dto) {
		return dao.profileUpdate(dto);
	}

}
