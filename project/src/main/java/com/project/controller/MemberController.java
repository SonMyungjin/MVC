package com.project.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.project.domain.MemberVO;
import com.project.service.MemberService;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@RequiredArgsConstructor
@RequestMapping("/member/*")
@Log4j
public class MemberController {
	
	private final MemberService service;
	
	@GetMapping("/list")
	public void list(Model model) {
		
		log.info("list......................................");
		
		model.addAttribute("list", service.getListMember());
	}

	@GetMapping("/register")
	public void registerGET() {
		
	}
	
	@PostMapping("/register")
	public String register(MemberVO member, RedirectAttributes rttr) {
		
		log.info("register:" + member);
		
		Long mno = service.registerMember(member);
		
		log.info("BNO: " + mno);
		
		rttr.addFlashAttribute("result", mno);
		
		return "redirect:/member/list";
	}
	
	@GetMapping({"/get","/modify"})
	public void get(@RequestParam("mno") Long mno, Model model) {
		
		log.info("/get or modify");
		model.addAttribute("member", service.getMember(mno));
	}
	
	@PostMapping("/modify")
	public String modify(MemberVO member, RedirectAttributes rttr) {
		
		int count = service.modifyMember(member);
		
		if(count == 1 ) {
			rttr.addFlashAttribute("result", "success");
		}
		return "redirect:/member/list";
	}

	@PostMapping("/remove")
	public String remove(@RequestParam("mno") Long mno, RedirectAttributes rttr) {
		
		int count = service.removeMember(mno);
		
		if(count == 1 ) {
			rttr.addFlashAttribute("result", "success");
		}
		return "redirect:/member/list";
	}
	
	@PostMapping("/login")
	public String login(HttpServletRequest request ,MemberVO member, RedirectAttributes rttr) {
		
		HttpSession session = request.getSession();
		MemberVO login = service.login(member);
		
        if(login == null) { // 일치하지 않는 아이디, 비밀번호 입력 경우
			session.setAttribute("member", null);
			rttr.addFlashAttribute("msg", false);
            return "redirect:/member/login";
        }
        session.setAttribute("member", login); // 일치하는 아이디, 비밀번호 경우 (로그인 성공)
		return "redirect:/member/list";
	}
	
	@GetMapping("/login")
	public void loginGET() {
	}
	
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/member/login";
	}
	
}
