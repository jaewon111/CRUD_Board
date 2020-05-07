package org.crud.jdbctest;

import static org.junit.Assert.fail;

import java.sql.Connection;
import java.sql.Driver;
import java.sql.DriverManager;

import org.junit.Test;

import lombok.extern.log4j.Log4j;

@Log4j
public class JDBCTest {
//DB가 연결이 되어있는지 확인  
	
	static {
		try {
			Class.forName("oracle.jdbc.driver.OralceDriver");
		}catch(Exception e) {
			e.printStackTrace();
		}
		
	}
	
	@Test
	public void testconnection() {
		try(Connection con = DriverManager.getConnection(
				"jdbc:oracle:thin:@localhost:1521:orcl",
				"crud_board",
				"crud_board")){
			
			log.info(con);
		} catch (Exception e) {
			// TODO: handle exception
			fail(e.getMessage());
		}
	}
	 
}
