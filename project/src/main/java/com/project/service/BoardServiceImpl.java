package com.project.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.project.domain.BoardVO;
import com.project.mapper.BoardMapper;
import com.project.util.FileUtils;

import lombok.RequiredArgsConstructor;
import lombok.ToString;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
@RequiredArgsConstructor
@ToString
public class BoardServiceImpl implements BoardService{

	private final BoardMapper mapper;
	
	@Resource(name="fileUtils")
	private FileUtils fileUtils;
	
	@Override
	public Long register(BoardVO board, MultipartHttpServletRequest mpRequest) {
		mapper.insertSelectKey(board);
		
		List<Map<String, Object>> list;
		try {
			list = fileUtils.parseInsertFileInfo(board, mpRequest);
			int size = list.size();
			
			System.out.println(size);
			for(int i=0; i<size; i++){ 
				
				System.out.println(list.get(i));
				mapper.insertFile(list.get(i)); 
			}
		} catch (Exception e) {
			e.printStackTrace();
		} 
		return board.getBno();
	}

	@Override
	public BoardVO get(Long bno) {
		return mapper.read(bno);
	}

	@Override
	public int modify(BoardVO board) {
		return mapper.update(board);
	}

	@Override
	public int remove(Long bno) {
		return mapper.delete(bno);
	}

	@Override
	public List<BoardVO> getList() {
		return mapper.getList();
	}
	
	@Override
	public List<Map<String, Object>> selectFileList(Long bno) {
		return mapper.selectFileList(bno);
	}
	
	@Override
	public Map<String, Object> selectFileInfo(Map<String, Object> map) {
		return mapper.selectFileInfo(map);
	}
	
	
	
}
