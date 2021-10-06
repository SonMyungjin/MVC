package com.project.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.project.domain.MemberVO;
import com.project.mapper.MemberMapper;

import lombok.RequiredArgsConstructor;
import lombok.ToString;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
@RequiredArgsConstructor
@ToString
public class MemberServiceImpl implements MemberService{
	
	private final MemberMapper memberMapper;

	@Override
	public Long registerMember(MemberVO member) {
		memberMapper.insertSelectKeyMember(member);
		return member.getMno();
	}
	
	@Override
	public MemberVO getMember(Long mno) {
		return memberMapper.read(mno);  
	}

	@Override
	public int modifyMember(MemberVO member) {
		return memberMapper.updateMember(member);
	}

	@Override
	public int removeMember(Long mno) {
		return memberMapper.deleteMember(mno);
	}
	
	@Override
	public List<MemberVO> getListMember() {
		return memberMapper.getListMember();
	}
	
	@Override
	public MemberVO login(MemberVO member) {
		return memberMapper.login(member);
	}

}
