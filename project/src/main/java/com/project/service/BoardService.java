package com.project.service;

import java.util.List;

import com.project.domain.BoardAttachVO;
import com.project.domain.BoardVO;

public interface BoardService {

	public void register(BoardVO board);
	
	BoardVO get(Long bno);
	
	boolean modify(BoardVO board);
	
	boolean remove(Long bno);
	
	List<BoardVO> getList();
	
	public List<BoardAttachVO> getAttachList(Long bno);

	public void removeAttach(Long bno);

}
