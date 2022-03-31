package com.mycompany.myapp.Service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import java.util.HashMap;

public interface MemberService {

	String join(Map<String, Object> map);

	Map<String, Object> detail(Map<String, Object> map);

	boolean edit(Map<String, Object> map);

	boolean remove(Map<String, Object> map);

	List<Map<String, Object>> list(Map<String, Object> map);
	//희영 추가 //동준 수정
	boolean select_login(Map<String, Object> map);
	
}
