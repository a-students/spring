package test;

import com.config.MainConfigAutowired;
import com.config.MainConfigofLifeCycle;
import com.service.PeopleService;
import org.junit.Test;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;

/**
 * @author chen
 * @date 2019/5/18--17:18
 */

public class IOCtest_Autowired {
    @Test
    public void test(){
        //创建IOC容器
        AnnotationConfigApplicationContext applicationContext = new AnnotationConfigApplicationContext(MainConfigAutowired.class);
        PeopleService bean = applicationContext.getBean(PeopleService.class);
        Object service = applicationContext.getBean("peopleService");
        System.out.println(service);
        System.out.println(bean);
    }
}
