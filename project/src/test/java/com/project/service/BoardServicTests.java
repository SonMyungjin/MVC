package com.project.service;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.project.domain.BoardVO;
import com.project.mapper.BoardMapperTests;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/spring/*.xml" })
@Log4j
public class BoardServicTests {
	
	@Autowired
	private BoardService service;
	
	@Test
	public void testPrint() {
		log.info(service);
	}
	
	@Test
	public void testGetList() {
		service.getList().forEach(board -> log.info(board));
	}
	
	@Test
	public void testRegister(BoardVO vo, MultipartHttpServletRequest mpRequest) {
		vo.setTitle("Test 테스트2");
		vo.setContent("Content 테스트2");
		vo.setWriter("tester2");
		
		long bno = service.register(vo,mpRequest);
		log.info("BNO : " + bno);
		
		
	}
	
}
