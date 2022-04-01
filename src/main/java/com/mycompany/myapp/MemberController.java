package com.mycompany.myapp;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.mybatis.logging.Logger;
import org.mybatis.logging.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.mycompany.myapp.Service.MemberService;


@Controller
@RequestMapping("member")
public class MemberController {
	@Autowired
	MemberService memberService;

	@RequestMapping(value = "/join", method = RequestMethod.GET)
	public ModelAndView create() { // 사실 이 메소드의 이름은 중요하지 않다. /create로 들어가면 이 메소드를 호출해기 때문.
		return new ModelAndView("member/join");
	}

	@RequestMapping(value = "/join", method = RequestMethod.POST)
	public ModelAndView createPost(@RequestParam Map<String, Object> map) {
		ModelAndView mav = new ModelAndView();
		System.out.println(map.toString());
		// {id=aadj, pw=bbdj, age=8764, book_id=4}
		String id = this.memberService.join(map);
		if (id == null) {
			mav.setViewName("redirect:/member/join");
		} else {
			mav.setViewName("redirect:/member/detail?id=" + id); // 생성한 책의 상세정보로 이동
		}

		return mav;
	}

	@RequestMapping(value = "/detail", method = RequestMethod.GET)
	public ModelAndView detail(@RequestParam Map<String, Object> map) {
		System.out.println("detail");
		System.out.println(map);
		Map<String, Object> detailMap = this.memberService.detail(map);

		ModelAndView mav = new ModelAndView();
		mav.addObject("data", detailMap);
		String id = map.get("id").toString();
		mav.addObject("id", id);
		mav.setViewName("/member/detail");

		System.out.println("mav");
		System.out.println(mav);

		return mav;
	}

	@RequestMapping(value = "/update", method = RequestMethod.GET)
	public ModelAndView update(@RequestParam Map<String, Object> map) {
		Map<String, Object> detailMap = this.memberService.detail(map);

		ModelAndView mav = new ModelAndView();
		mav.addObject("data", detailMap);
		mav.setViewName("/member/update");
		System.out.println("mav : update : GET");
		System.out.println(mav);
		return mav;
	}

	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public ModelAndView udpatePost(@RequestParam Map<String, Object> map) {
		ModelAndView mav = new ModelAndView();
		boolean isUpdateSuccess = this.memberService.edit(map);
		if (isUpdateSuccess) {
			String id = map.get("id").toString();
			mav.setViewName("redirect:/member/detail?id=" + id);
		} else {
			mav = this.update(map);
		}

		return mav;
	}

	@RequestMapping(value = "/delete", method = RequestMethod.POST)
	public ModelAndView deletePost(@RequestParam Map<String, Object> map) {
		ModelAndView mav = new ModelAndView();
		boolean isDeleteSuccess = this.memberService.remove(map);
		if (isDeleteSuccess) {
			mav.setViewName("redirect:/member/list");
		} else {
			String id = map.get("id").toString();
			mav.setViewName("redirect:/member/detail?id=" + id);
		}
		return mav;
	}

	@RequestMapping(value = "/list")
	public ModelAndView list(@RequestParam Map<String, Object> map) {
		System.out.println("list");
		System.out.println(map);
		List<Map<String, Object>> list = this.memberService.list(map);
		ModelAndView mav = new ModelAndView();

		mav.addObject("data", list);

		if (map.containsKey("keyword")) {
			mav.addObject("keyword", map.get("keyword"));
		}

		mav.setViewName("/member/list");
		return mav;
	}

	// 희영 추가 및 동준 수정
	//map은 null값이므로 처음엔 단순히 로그인을 띄우기만 한다.
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public ModelAndView selectGet(@RequestParam Map<String, Object> map) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/member/login");
		return mav;
		}
	
	// 동준 추가
	// 본격적 로그인
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public ModelAndView selectPost(@RequestParam Map<String, Object> map, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		System.out.println(map);
		boolean isLoginSuccess = this.memberService.select_login(map);
		System.out.println(isLoginSuccess);
		if (isLoginSuccess) {
			String id = map.get("id").toString();
			mav.addObject("id", id);
			mav.setViewName("redirect:/");
		} else {
			mav.setViewName("redirect:/member/login");
		}
		return mav;
		}
	
	  /* 메인페이지 로그아웃 */

	//logout
	   @RequestMapping("/logout")
	    public ModelAndView logout(HttpSession session) {
	        session.invalidate();
	        ModelAndView mv = new ModelAndView("redirect:/");
	        return mv;
	    }

}