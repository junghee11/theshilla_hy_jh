package com.mycompany.myapp;

import java.util.List;
import java.util.Map;

public interface Reservation {

	String createReservation(Map<String, Object> map);

	List<Map<String, Object>> list(Map<String, Object> map);

	List<Map<String, Object>> dateCheck(Map<String, Object> map);

	Map<String, Object> detail(Map<String, Object> map);

	boolean remove(Map<String, Object> map);

	boolean pay_update(Map<String, Object> map);

}
