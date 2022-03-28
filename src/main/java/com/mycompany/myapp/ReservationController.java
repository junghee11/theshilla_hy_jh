package com.mycompany.myapp;

import java.util.List;
import java.util.Map;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ReservationController {
	
	@Autowired
	Reservation reservation;
	
	@RequestMapping(value="/list", method=RequestMethod.GET)
	public ModelAndView list(@RequestParam Map<String, Object> map) {
		List<Map<String, Object>> list = this.reservation.list(map);
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("data", list);
		mav.setViewName("reservation/Reservation_step1");
		return mav;
	}
	
	@RequestMapping(value="date_check", method=RequestMethod.GET)
	public ModelAndView dateCheck(@RequestParam Map<String, Object> map, HttpServletRequest httpServletRequest) {
		ModelAndView mav = new ModelAndView();
		List<Map<String, Object>> list = this.reservation.dateCheck(map);
		
		String date_in = httpServletRequest.getParameter("date_in");
		String date_out = httpServletRequest.getParameter("date_out");
		
		mav.addObject("data", list);
		mav.addObject("date_in", date_in);
		mav.addObject("date_out", date_out);

		mav.setViewName("reservation/Reservation_step1");
		return mav;
	}
	
	@RequestMapping(value="select_room", method=RequestMethod.POST)
	public ModelAndView createReservation(@RequestParam Map<String, Object> map) {
		
		ModelAndView mav = new ModelAndView();
		System.out.println(map);
		String Rsv_idx = this.reservation.createReservation(map);
		if(Rsv_idx==null) {
			mav.setViewName("redirect:/list");
		} else {
			mav.setViewName("redirect:/Reservation_step2?Rsv_idx="+Rsv_idx);
		}
		
		return mav;
	}
	
//	@RequestMapping(value="/Reservation_step2", method = RequestMethod.GET)
//	public ModelAndView detail(@RequestParam Map<String, Object> map) {
//		System.out.println(map);
//		String rs = (String) map.get("Rsv_idx");
//		System.out.println(rs);
//		Map<String, Object> detailMap = this.reservation.detail(rs);
//		System.out.println(map);
//		System.out.println(detailMap);
//		ModelAndView mav = new ModelAndView();
//		mav.addObject("detail", detailMap);
//		String rsv_idx = map.get("Rsv_idx").toString(); 
//		mav.addObject("Rsv_idx", rsv_idx);
//		mav.setViewName("/reservation/Reservation_step2");
//		return mav;
//	}	
	
	@RequestMapping(value="/Reservation_step2", method = RequestMethod.GET)
	public ModelAndView roomDetail(@RequestParam Map<String, Object> map) {
		ModelAndView mav = new ModelAndView();
		System.out.println(map);
		Map<String, Object> detailMap = this.reservation.detail(map);
		System.out.println(map);
		System.out.println(detailMap);
		mav.addObject("detail", detailMap);
		String rsv_idx = map.get("Rsv_idx").toString(); 
		mav.addObject("Rsv_idx", rsv_idx);
		mav.setViewName("/reservation/Reservation_step2");
		return mav;
	}	
	
	@RequestMapping(value="cancelDeal", method = RequestMethod.POST)
	public ModelAndView deleteRsv(@RequestParam Map<String, Object> map) {
		ModelAndView mav = new ModelAndView();
		System.out.println(map);
		boolean isDeleteSuccess = this.reservation.remove(map);
		if(isDeleteSuccess) {
			mav.setViewName("redirect:/index");
		} else {
			String rsv_idx = map.get("rsv_idx").toString();
			mav.setViewName("redirect:/Reservation_step2?rsv_idx="+rsv_idx);
		}
		return mav;
	}
	
	@RequestMapping(value="kakaoPay", method = RequestMethod.POST)
	public ModelAndView payment(@RequestParam Map<String, Object> map) {
		
		
		ModelAndView mav = new ModelAndView();
		return mav;
	}
	
	//예약확인
	
	
	
	
	
	
	
}
