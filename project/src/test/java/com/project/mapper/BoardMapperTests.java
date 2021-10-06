package com.project.mapper;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.project.domain.BoardVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/spring/*.xml" })
@Log4j
public class BoardMapperTests {
	
	@Autowired
	private BoardMapper boardMapper;
	
	@Test
	public void testGetList() {
		 
		boardMapper.getList().forEach(boardMapper -> log.info(boardMapper));
	}
	
	@Test
	public void testInsert() {
		BoardVO vo = new BoardVO();
		vo.setTitle("Test 테스트");
		vo.setContent("Content 테스트");
		vo.setWriter("tester");
		
		boardMapper.insert(vo);
		log.info("----------------------");
		log.info("after insert" + vo.getBno());
	}
	
	@Test
	public void testInsertSelectKey(){
		
		BoardVO vo = new BoardVO();
		vo.setTitle("Test 테스트");
		vo.setContent("Content 테스트");
		vo.setWriter("tester");
		
		boardMapper.insertSelectKey(vo);	
		log.info("----------------------");
		log.info("after insert selectKey" + vo.getBno());
	}
	
	@Test
	public void testRead() {
		
		BoardVO vo = boardMapper.read(3L);
		log.info(vo);
	}
	
	@Test
	public void testDelete() {
		int count = boardMapper.delete(3L);
		log.info("count: " + count);
	}
	
	@Test
	public void testUpdate() {
		
		BoardVO vo = new BoardVO();
		vo.setBno(1L);
		vo.setTitle("Update Title");
		vo.setContent("Update content");
		vo.setWriter("user00");
		
		log.info("count : " + boardMapper.update(vo));
	}
	
	
	}

