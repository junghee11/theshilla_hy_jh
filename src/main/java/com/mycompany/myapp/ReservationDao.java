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
	
	public List<Map<String, Object>> selectList(Map<String, Object> map) {
		return this.sqlSessionTemplate.selectList("reservation.room_list", map);
	}
	
	public List<Map<String, Object>> duplicateCheck(Map<String, Object> map) {
		return this.sqlSessionTemplate.selectList("reservation.checked_room", map);
	}
}
