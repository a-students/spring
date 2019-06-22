package com.conditional;

import org.springframework.context.annotation.ImportSelector;
import org.springframework.core.type.AnnotationMetadata;
import org.springframework.core.type.MethodMetadata;

import java.util.Set;

/**
 * @author chen
 * @date 2019/5/16--22:07
 */
/*自定义逻辑返回需要导入的组件
*
* */
public class Myimportselector implements ImportSelector {
    //AnnotationMetadata:当前标注@Import注解的类的所有注解信息
    @Override
    public String[] selectImports(AnnotationMetadata importingClassMetadata) {
        //返回值就是要导入到容器中组件的全类名
        //方法不能返回null
      /*
      获取注解类型
      Set<String> types = importingClassMetadata.getAnnotationTypes();
            for (String type :types){
            System.out.println("AnnotationType:"+type);
        }*/
        Set<MethodMetadata> annotatedMethods = importingClassMetadata.getAnnotatedMethods("people");
        for (MethodMetadata type:annotatedMethods){
            System.out.println("MethodMetadata"+type);
        }
        return new String[]{"com.bean.color","com.bean.red"};
    }
}

/*
* public class HelloImportSelector implements ImportSelector {

    @Override
    public String[] selectImports(AnnotationMetadata importingClassMetadata) {
        Map<String, Object> annotationAttributes = importingClassMetadata.getAnnotationAttributes(ComponentScan.class.getName());
        String[] basePackages = (String[]) annotationAttributes.get("basePackages");
        ClassPathScanningCandidateComponentProvider scanner = new ClassPathScanningCandidateComponentProvider(false);
        TypeFilter helloServiceFilter = new AssignableTypeFilter(HelloService.class);
        scanner.addIncludeFilter(helloServiceFilter);
        Set<String> classes = new HashSet<>();
        for (String basePackage : basePackages) {
            scanner.findCandidateComponents(basePackage).forEach(beanDefinition -> classes.add(beanDefinition.getBeanClassName()));
        }
        return classes.toArray(new String[classes.size()]);
    }

}

* */
