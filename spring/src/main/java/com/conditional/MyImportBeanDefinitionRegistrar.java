package com.conditional;


import com.bean.rain;
import org.springframework.beans.factory.support.BeanDefinitionRegistry;
import org.springframework.beans.factory.support.RootBeanDefinition;
import org.springframework.context.annotation.ImportBeanDefinitionRegistrar;
import org.springframework.core.type.AnnotationMetadata;

/**
 * @author chen
 * @date 2019/5/16--22:30
 */
public class MyImportBeanDefinitionRegistrar implements ImportBeanDefinitionRegistrar {
    /*AnnotationMetadata：当前类的注解信息
    * BeanDefinitionRegistry:BeanDefinition注册类
    *       把所有需要添加到容器中的bean:调用BeanDefinitionRegistry.registerBeanDefinitions手工注册
    * */
    @Override
    public void registerBeanDefinitions(AnnotationMetadata importingClassMetadata, BeanDefinitionRegistry registry) {
        boolean definition = registry.containsBeanDefinition("people2");
        boolean people = registry.containsBeanDefinition("people");
        if (definition&&people){
            System.out.println("执行到这了。。。");
            RootBeanDefinition rain = new RootBeanDefinition(rain.class);
            registry.registerBeanDefinition("beanname",rain);
        }
    }
}
