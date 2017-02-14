package dgtransport;

import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.paxonpilot.dgtransport.entity.Enterprise;
import com.paxonpilot.dgtransport.service.EnterpriceSerivceImpl;

public class ServiceTest {

	@Test
	public void saveEnterprice() throws Exception{

		ApplicationContext context = new ClassPathXmlApplicationContext("classpath:applicationContext.xml");
		System.out.println("context --- "+context);
		EnterpriceSerivceImpl enterpriseService = (EnterpriceSerivceImpl)context.getBean("enterpriceSerivce");
		System.out.println("enterpriseService --- "+enterpriseService);
		Enterprise en = new Enterprise();
		en.setEpName("·¬Ø®XXXË³µÂ");
		enterpriseService.addEntity(en);
	}

//	@Test
	public void updateEnterprice() throws Exception{
		ApplicationContext context = new ClassPathXmlApplicationContext("classpath:applicationContext.xml");
		System.out.println("context --- "+context);
		EnterpriceSerivceImpl enterpriseService = (EnterpriceSerivceImpl)context.getBean("enterpriceSerivce");
		System.out.println("enterpriseService --- "+enterpriseService);
		Enterprise en = new Enterprise();
		en.setEpName("·¬Ø®XXXË³µÂ");
		enterpriseService.addEntity(en);
	}

}
