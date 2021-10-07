package com.project.mapper;

import java.util.List;
import java.util.Map;

import com.project.domain.BoardVO;

public interface BoardMapper {
	
	public List<BoardVO> getList();
	
	public void insert(BoardVO board);

	public void insertFile(Map<String, Object> map);
	
	public BoardVO read(Long bno);
	
	public int delete(Long bno);
	
	public int update(BoardVO board);
	
	public void insertSelectKey(BoardVO board);

	public List<Map<String, Object>> selectFileList(Long bno);
	
	public Map<String, Object> selectFileInfo(Map<String, Object> map);

	
}
