package test;

import com.bean.Car;
import com.config.MainConfigofLifeCycle;
import org.junit.Test;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;
import org.springframework.context.annotation.ComponentScan;

/**
 * @author chen
 * @date 2019/5/18--17:18
 */

public class IOCtest_lifecycle {
    @Test
    public void test(){
        //创建IOC容器
        AnnotationConfigApplicationContext applicationContext = new AnnotationConfigApplicationContext(MainConfigofLifeCycle.class);
        Car car = (Car) applicationContext.getBean("car");
        //关闭容器
        applicationContext.close();
    }
}
