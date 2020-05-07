package replyMapperTest;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.crud.domain.ReplyVO;
import org.crud.mapper.ReplyMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({
	"file:src/main/webapp/WEB-INF/spring/root-context.xml",
})
@Log4j
public class tests {

	@Setter(onMethod_ =@Autowired )
	   private ReplyMapper mapper;
	
	@Test
	public void testRead() {
		Long Rno = 2L;
		
		ReplyVO vo = mapper.read(Rno);
		log.info(vo);
	}

	
	  @Test
	  public void testDelete() {
		  Long Rno = 42L;
		  mapper.delete(Rno);
	  }
}
