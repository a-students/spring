package com.config;


import com.bean.People;
import com.service.PeopleService;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.FilterType;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;

/**
 * @author chen
 * @date 2019/5/16--10:54
 */
//配置类==配置文件5
@Configuration
@ComponentScan(value = "com",includeFilters = {
      /* @ComponentScan.Filter(type = FilterType.ANNOTATION,classes = {Controller.class}),
       @ComponentScan.Filter(type = FilterType.ASSIGNABLE_TYPE,classes ={PeopleService.class}),
       /*@ComponentScan.Filter(type = FilterType.CUSTOM,classes = {typefilter.class})*/
},useDefaultFilters = false)
//@ComponentScan value:指定要扫描的包
// @ComponentScan.Filter 扫描规则
/*excludeFilters =Filter[],
excludeFilters = {  //不要扫描哪些包 指定扫描包时按照什么规则排除哪些组件
        @ComponentScan.Filter(type = FilterType.ANNOTATION,classes = {Controller.class})}
*       type = FilterType.ANNOTATION 按照什么规则
*                           ANNOTATION 按照注解
*       classes = {Controller.class}  排除哪些组件
*                           Controller.class    排除带有@Controller的组件
*
* */
/*includeFilters =Filter[] 指定扫描时只需要包含哪些组件
    相同点:规则同上,
    不同点:spring默认加载所有组件,所以必须将加载规则禁用 useDefaultFilters = false
* */
/*FilterType.ASSIGNABLE_TYPE:按照给定的类型
  FilterType.ANNOTATION:按照注解
  FilterType.CUSTOM:自定义规则
* */
public class mainconfig{
    @Bean(value = "people1")
    /*给容器中注册一个Bean;类型为返回值的类型,id默认是用方法名作为id*/
    public People people(){
        return new People("李四",18);
    }
}
