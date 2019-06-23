package test;

import com.bean.People;
import com.config.config02;
import com.config.mainconfig;
import org.junit.Test;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;

import java.util.Map;

/**
 * @author chen
 * @date 2019/5/16--11:25
 */
public class maintest {
    @Test
    @SuppressWarnings("resource")
    public void testimport(){
        AnnotationConfigApplicationContext applicationContext = new AnnotationConfigApplicationContext(config02.class);
        String[] names = applicationContext.getBeanDefinitionNames();
        for (String name:names
        ) {
            System.out.println(name);
        }
        Object bean= applicationContext.getBean("colorfactorybean");
        Object bean1= applicationContext.getBean("colorfactorybean");
        System.out.println("bean的类型"+bean.getClass());
        System.out.println(bean==bean1);
    }
    @Test
    @SuppressWarnings("resource")
    public void test(){
        AnnotationConfigApplicationContext applicationContext = new AnnotationConfigApplicationContext(config02.class);
        String[] names = applicationContext.getBeanDefinitionNames();
        for (String name:names
        ) {
            System.out.println(name);
        }

    }
    @Test
    public void test01(){
        AnnotationConfigApplicationContext applicationContext = new AnnotationConfigApplicationContext(config02.class);
        People people = (People)applicationContext.getBean("people");
        People people2 = (People)applicationContext.getBean("people");
        System.out.println(people==people2);
    }
    @Test
    public void test02(){
        AnnotationConfigApplicationContext applicationContext = new AnnotationConfigApplicationContext(config02.class);
        String[] names = applicationContext.getBeanNamesForType(People.class);
        for (String name:names
             ) {
            System.out.println(name);

        }
        Map<String, People> map = applicationContext.getBeansOfType(People.class);
        System.out.println(map);
    }
}
