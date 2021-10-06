package com.project.service;

import java.util.List;

import com.project.domain.BoardVO;

public interface BoardService {

	Long register(BoardVO board);
	
	BoardVO get(Long bno);
	
	int modify(BoardVO board);
	
	int remove(Long bno);
	
	List<BoardVO> getList();
	
}
