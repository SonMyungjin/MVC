package com.project.mapper;

import java.util.List;

import com.project.domain.BoardAttachVO;
import com.project.domain.BoardVO;

public interface BoardMapper {
	
	public List<BoardVO> getList();
	
	public void insert(BoardVO board);
	
	public void insertSelectKey(BoardVO board);

	public BoardVO read(Long bno);
	
	public int delete(Long bno);
	
	public int update(BoardVO board);

	public List<BoardAttachVO> findByBno(Long bno);
	
}
