package test;

import com.aop.LogAspects;
import com.aop.MathCalculator;
import com.config.MainConfigAutowired;
import com.config.MainConfigOfAOP;
import com.service.PeopleService;
import org.junit.Test;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;

/**
 * @author chen
 * @date 2019/5/18--17:18
 */

public class IOCtest_AOP {
    @Test
    public void test(){
        //创建IOC容器
        AnnotationConfigApplicationContext applicationContext = new AnnotationConfigApplicationContext(MainConfigOfAOP.class);
        MathCalculator bean = applicationContext.getBean(MathCalculator.class);
        LogAspects bean1 = applicationContext.getBean(LogAspects.class);
        int div = bean.division(1, 1);
        System.out.println(div);
        System.out.println(bean1);
    }
}
