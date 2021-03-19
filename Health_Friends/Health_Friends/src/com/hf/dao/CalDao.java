package com.hf.dao;

import java.util.List;

import com.hf.dto.CalDto;

public interface CalDao {
	
	String INSERT_CAL_BOARD_SQL = " INSERT INTO CALBOARD "
								+ " VALUES(CALBOARDSEQ.NEXTVAL,? ,? ,? ,?, SYSDATE) ";;
								
	String GET_CAL_LIST_SQL = " SELECT SEQ, ID, TITLE, CONTENT, MDATE, REGDATE "
			   				+ " FROM CALBOARD "
			   				+ " WHERE ID = ? "
			   				+ " AND SUBSTR(MDATE, 1, 8) = ? ";
	
	String GET_CAL_VIEW_LIST_SQL = " SELECT * "
								 + " FROM "
								 + " ( "
								 + " SELECT(ROW_NUMBER() OVER(PARTITION BY SUBSTR(MDATE, 1, 8) ORDER BY MDATE))RN, SEQ, ID, TITLE, CONTENT, MDATE, REGDATE "
								 + " FROM CALBOARD "
								 + " WHERE ID = ? "
								 + " AND SUBSTR(MDATE, 1, 6)=? "
								 + " ) "
								 + " WHERE RN BETWEEN 1 AND 4 ";
								
	String GET_CAL_VIEW_COUNT_SQL = " SELECT COUNT(*) "
								  + " FROM CALBOARD "
								  + " WHERE ID = ? "
								  + " AND SUBSTR(MDATE, 1, 8) = ? ";
								
	String SELECT_ONE_CAL_BOARD_SQL = " SELECT SEQ, ID, TITLE, CONTENT, MDATE, REGDATE "
									+ " FROM CALBOARD WHERE SEQ = ? ";
	
	String UPDATE_CAL_BOARD_SQL = " UPDATE CALBOARD "
								+ " SET TITLE = ?, CONTENT = ? "
								+ " WHERE SEQ = ? ";
	
	String DELETE_CAL_BOARD_SQL = " DELETE FROM CALBOARD "
			   					+ " WHERE SEQ = ? ";
								
								
	int insertCalBoard(CalDto dto);
	public List<CalDto> getCalList(String id, String yyyyMMdd);
	public List<CalDto> getCalViewList(String id, String yyyyMM);
	public int getCalViewCount(String id, String yyyyMMdd);
	public CalDto selectOneCalBoard(int seq);
	public int updateCalBoard(CalDto dto);
	public int deleteCalBoard(int seq);

}
