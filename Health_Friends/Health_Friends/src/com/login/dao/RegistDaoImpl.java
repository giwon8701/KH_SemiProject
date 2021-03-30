package com.login.dao;



import org.apache.ibatis.session.SqlSession;

import com.common.SqlMapConfig;
import com.login.dto.RegistDto;


public class RegistDaoImpl extends SqlMapConfig implements RegistDao {

	@Override
	public int registCheck(String member) {
		int cnt = -1;
		
		try(SqlSession session = getSqlSessionFactory().openSession(true);){
			cnt = session.selectOne("registmapper.registCheck", member);
			System.out.println(member);
			
			if(cnt > 0) {
				cnt = 1;
			} else {
				cnt = 0;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return cnt;
	}

	@Override
	public int registMember(RegistDto dto) {
		int res = 0;
		
		try(SqlSession session = getSqlSessionFactory().openSession(false);) {
			res = session.insert("registmapper.regist", dto);
			System.out.println("res : " + res);
			if(res>0) {
				session.commit();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return res;
	}
	
	@Override
	public int login(RegistDto logindto) {
		
		int cnt = -1;
		
		try(SqlSession session = getSqlSessionFactory().openSession(true);){
			
			cnt = session.selectOne("registmapper.selectCnt", logindto);
			//System.out.println(logindto.getMember_id());
			if(cnt > 0) {
				cnt = 1;
			} else {
				cnt = 0;
			}
			
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return cnt;
	}
	
	@Override
	public RegistDto selectOne(RegistDto logindto) {
		
		RegistDto dto = new RegistDto();
		
		try(SqlSession session = getSqlSessionFactory().openSession(true);){
			dto = session.selectOne("registmapper.selectOne", logindto);
		}  catch (Exception e) {
			e.printStackTrace();
		}
		
		return dto;
	};
	
	@Override
	public RegistDto selectByEmail(String email) {
		
		RegistDto dto = new RegistDto();
		
		try(SqlSession session = getSqlSessionFactory().openSession(true);){
			dto.setMember_email(email);
			dto = session.selectOne("registmapper.selectOne", dto);
		}  catch (Exception e) {
			e.printStackTrace();
		}
		
		return dto;
	}
	
	@Override
	public RegistDto selectById(String id) {
		
		RegistDto dto = new RegistDto();
		System.out.println("id : " + id);
		try(SqlSession session = getSqlSessionFactory().openSession(true);){
			dto.setMember_id(id);
			dto = session.selectOne("registmapper.selectOne", dto);
			System.out.println("dao: " + dto.getMember_id());
		}  catch (Exception e) {
			e.printStackTrace();
		}
		
		return dto;
	}
	
	@Override
	public RegistDto idSearch(RegistDto dto) {
		
		int cnt = 0;
		RegistDto Ldto = null;
		
		try(SqlSession session = getSqlSessionFactory().openSession(true);){
			cnt = session.selectOne("registmapper.selectCnt", dto);
			if(cnt > 0) {
				Ldto = session.selectOne("registmapper.selectOne", dto);
			}
			
		}  catch (Exception e) {
			e.printStackTrace();
		}
		
		return Ldto;
	}
	
	@Override
	public int pwSearch(RegistDto dto) {
		int cnt = -1;
		try(SqlSession session = getSqlSessionFactory().openSession(true);){
			cnt = session.selectOne("registmapper.selectCnt", dto);
			if(cnt == 1) {
				cnt = 1;
			} else {
				cnt = 0;
			}
		}  catch (Exception e) {
			e.printStackTrace();
		}
		
		return cnt;
	}
	
	@Override
	public int pwReset(RegistDto dto) {
		int res = -1;
		try(SqlSession session = getSqlSessionFactory().openSession(false);){
			res = session.update("registmapper.pwReset", dto);
			
			if(res > 0) {
				session.commit();
			} else {
				res = 0;
			}
		}  catch (Exception e) {
			e.printStackTrace();
		}
		
		return res;
	}
	
	@Override
	public int updateRegist(RegistDto dto) {
		int res = -1;
		try(SqlSession session = getSqlSessionFactory().openSession(false);){
			res = session.update("registmapper.updateRegist", dto);
			System.out.println("res: " + res);
			if(res > 0) {
				session.commit();
			}
		}  catch (Exception e) {
			e.printStackTrace();
		}
		
		return res;
	}
	
	@Override
	public int deleteRegist(String member_id) {
		int res = -1;
		try(SqlSession session = getSqlSessionFactory().openSession(false);){
			res = session.update("registmapper.deleteRegist", member_id);
			if(res > 0) {
				session.commit();
			}
		}  catch (Exception e) {
			e.printStackTrace();
		}
		
		return res;
	}

}
