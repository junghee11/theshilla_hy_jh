package com.mycompany.myapp;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ReservationImpl implements Reservation {

	@Autowired
	ReservationDao reservationDao;
	
	@Override
	public String createReservation(Map<String, Object> map) {
		int affectRowCount = this.reservationDao.insert(map);
		if(affectRowCount == 1) {
			return map.get("rsv_idx").toString();
		}
		return null;
	}
	
	@Override
	public Map<String, Object> detail(Map<String, Object> map) {
		return this.reservationDao.selectDetail(map);
	}
	
	@Override
	public List<Map<String, Object>> list(Map<String, Object> map){
		return this.reservationDao.selectList(map);
	}
	
	@Override
	public List<Map<String, Object>> dateCheck(Map<String, Object> map) {
		return this.reservationDao.duplicateCheck(map);
	}
	
}
