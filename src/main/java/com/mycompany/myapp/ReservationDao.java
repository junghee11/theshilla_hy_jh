package com.mycompany.myapp;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ReservationDao {

	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	public int insert(Map<String, Object> map) {
		return this.sqlSessionTemplate.insert("reservation.insert_reservation", map);
	}
	
	public Map<String, Object> selectDetail(Map<String, Object> map) {
		return this.sqlSessionTemplate.selectOne("reservation.rsv_detail", map);
	}
	
	public List<Map<String, Object>> selectList(Map<String, Object> map) {
		return this.sqlSessionTemplate.selectList("reservation.room_list", map);
	}
	
	public List<Map<String, Object>> duplicateCheck(Map<String, Object> map) {
		return this.sqlSessionTemplate.selectList("reservation.checked_room", map);
	}
	
	public int delete(Map<String, Object> map) {
		return this.sqlSessionTemplate.delete("reservation.delete_rsv", map);
	}
	
	public int update(Map<String, Object> map) {
		return this.sqlSessionTemplate.update("reservation.pay_ok", map);
	}
}
