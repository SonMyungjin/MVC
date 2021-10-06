package com.project.service;

import java.util.List;

import com.project.domain.MemberVO;

public interface MemberService {
	
	Long registerMember(MemberVO member);
	
	MemberVO getMember(Long mno);
	
	int modifyMember(MemberVO member);
	
	int removeMember(Long mno);
	
	List<MemberVO> getListMember();
	
	MemberVO login(MemberVO member);

}
