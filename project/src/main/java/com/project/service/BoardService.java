package com.project.service;

import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.project.domain.BoardVO;

public interface BoardService {

	Long register(BoardVO board, MultipartHttpServletRequest mpRequest);
	
	BoardVO get(Long bno);
	
	int modify(BoardVO board);
	
	int remove(Long bno);
	
	List<BoardVO> getList();

	List<Map<String, Object>> selectFileList(Long bno);
	
	Map<String, Object> selectFileInfo(Map<String, Object> map);
	

}
