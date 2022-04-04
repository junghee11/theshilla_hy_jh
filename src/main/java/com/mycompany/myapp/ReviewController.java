package com.mycompany.myapp;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.mycompany.myapp.Service.ReviewService;

@Controller
@RequestMapping("review")
public class ReviewController {
	
	@Autowired
	ReviewService reviewService;
	
	@RequestMapping(value="/create", method=RequestMethod.GET)
	public ModelAndView create(@RequestParam Map<String, Object> map) { //사실 이 메소드의 이름은 중요하지 않다. /create로 들어가면 이 메소드를 호출해기 때문.
		ModelAndView mav = new ModelAndView();
		Map<String, Object> info = this.reviewService.preInfo(map);
		System.out.println(info);
		mav.addObject("review", info);
		mav.setViewName("/review/create");
		return mav;
	}
	
	@RequestMapping(value="/create", method= RequestMethod.POST)
	public ModelAndView createPost(@RequestParam Map<String, Object> map) {
		ModelAndView mav = new ModelAndView();
		System.out.println(map.toString());
		//{title=aadj, category=bbdj, price=8764, book_review_no=4}
		String review_no = this.reviewService.create(map);
		if(review_no==null) {
			mav.setViewName("redirect:/review/create");
		} else {
			mav.setViewName("redirect:/review/detail?review_no="+review_no); //생성한 책의 상세정보로 이동
		}
		
		return mav;
	}
	
	
	@RequestMapping(value="/detail", method= RequestMethod.GET)
	public ModelAndView detail(@RequestParam Map<String, Object> map) {
		System.out.println("detail");
		System.out.println(map);
		Map<String, Object> detailMap = this.reviewService.detail(map);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("data", detailMap);
		String review_no = map.get("review_no").toString();
		mav.addObject("review_no", review_no);
		mav.setViewName("/review/detail");
		
		System.out.println("mav");
		System.out.println(mav);
		
		return mav;
	}
	
	
	@RequestMapping(value="/update", method=RequestMethod.GET)
	public ModelAndView update(@RequestParam Map<String, Object> map) {
		Map<String, Object> detailMap = this.reviewService.detail(map);
		
		ModelAndView mav= new ModelAndView();
		mav.addObject("data", detailMap);
		mav.setViewName("/review/update");
		System.out.println("mav : update : GET");
		System.out.println(mav);
		return mav;
	}
	
	@RequestMapping(value="update", method=RequestMethod.POST) 
	public ModelAndView updatePost(@RequestParam Map<String, Object> map) {
		ModelAndView mav = new ModelAndView();
		boolean isUpdateSuccess = this.reviewService.edit(map);
		if(isUpdateSuccess) {
			String review_no = map.get("review_no").toString();
			mav.setViewName("redirect:/review/detail?review_no="+review_no);
		} else {
			mav=this.update(map);
		}
		
		return mav;
	}
	
	@RequestMapping(value="/delete", method=RequestMethod.POST)
	public ModelAndView deletePost(@RequestParam Map<String,Object> map) {
		ModelAndView mav = new ModelAndView();
		boolean isDeleteSuccess = this.reviewService.remove(map);
		if(isDeleteSuccess) {
			mav.setViewName("redirect:/review/list");
		} else {
			String review_no = map.get("review_no").toString();
			mav.setViewName("redirect:/review/detail?review_no="+review_no);
		}
		return mav;
	}
	
	@RequestMapping(value="list")
	public ModelAndView list(@RequestParam Map<String, Object> map) {
		System.out.println("list");
		System.out.println(map);
		List<Map<String, Object>> list = this.reviewService.list(map);
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("data",list);
		
		if (map.containsKey("keyword")) {
			mav.addObject("keyword", map.get("keyword"));
		}
		

		
		
		mav.setViewName("/review/list");
		return mav;
	}

}
