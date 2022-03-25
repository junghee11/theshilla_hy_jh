package com.mycompany.myapp;

import java.util.List;
import java.util.Map;

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
	
	@RequestMapping(value="list", method=RequestMethod.GET)
	public ModelAndView list(@RequestParam Map<String, Object> map) {
		List<Map<String, Object>> list = this.reservation.list(map);
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("data", list);
		mav.setViewName("reservation/Reservation");
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

		mav.setViewName("reservation/Reservation");
		return mav;
	}
	
	@RequestMapping(value="insert_reservation", method=RequestMethod.POST)
	public ModelAndView createReservation(@RequestParam Map<String, Object> map) {
		
		ModelAndView mav = new ModelAndView();
		
		String rsv_idx = this.reservation.createReservation(map);
		if(rsv_idx==null) {
			mav.setViewName("redirection:/list");
		} else {
			mav.setViewName("redirection:/reservation_detail?rsv_idx");
		}
		
		return mav;
	}

}
