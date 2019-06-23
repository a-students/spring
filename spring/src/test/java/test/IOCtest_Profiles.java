package test;

import com.config.MainConfigAutowired;
import com.config.MainConfigOfProfile;
import com.service.PeopleService;
import org.junit.Test;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;

/**
 * @author chen
 * @date 2019/5/18--17:18
 */

public class IOCtest_Profiles {
    @Test
    public void test(){
        //创建IOC容器
        AnnotationConfigApplicationContext applicationContext = new AnnotationConfigApplicationContext(MainConfigOfProfile.class);
        String[] names = applicationContext.getBeanDefinitionNames();
        for (String name:names
             ) {
            System.out.println(name);
        }
    }
}
