package com.project.mapper;

import java.util.List;

import com.project.domain.MemberVO;

public interface MemberMapper {
	
	public List<MemberVO> getListMember();
	
	public void insertMember(MemberVO member);
	
	public void insertSelectKeyMember(MemberVO member);
	
	public MemberVO read(Long mno);
	
	public int deleteMember(Long mno);
	
	public int updateMember(MemberVO member);
	
	public MemberVO login(MemberVO member);
}
