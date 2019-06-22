package test;

import com.config.MainConfigPropertyValue;
import com.config.MainConfigofLifeCycle;
import org.junit.Test;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;

/**
 * @author chen
 * @date 2019/5/18--17:18
 */

public class IOCtest_PropertyValue{
    @Test
    public void test(){
        //创建IOC容器
        AnnotationConfigApplicationContext applicationContext = new AnnotationConfigApplicationContext(MainConfigPropertyValue.class);
        System.out.println("容器创建完成");
        printbeean(applicationContext);
        Object people = applicationContext.getBean("people");
        System.out.println(people.toString());
        //关闭容器
        applicationContext.close();
    }
    private void printbeean(AnnotationConfigApplicationContext applicationContext){
        String[] beanDefinitionNames = applicationContext.getBeanDefinitionNames();
        for (String name:beanDefinitionNames
             ) {
            System.out.println(name);
        }
    }
}
