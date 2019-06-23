package com.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Profile;

import javax.sql.DataSource;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.SQLFeatureNotSupportedException;
import java.util.logging.Logger;

/**
 * @author chen
 * @date 2019/5/19--15:28
 */
/*
*   Profile:
*           Spring为我们提供的根据当前环境,动态激活和切换一系列组件的功能
*   @Profile:指定组件在哪个环境下才能被注册到容器中,不指定,任何环境下都能注册这个组件
*       1.加了环境标识都bean,只有这个环境被激活才能注册到容器中,默认是default环境
*       2.写在配置类上,只有是指定的环境的时候,整个配置类里面的所有配置才能开始生效
*       3.没有标识的bean,在任何环境下都加载
*
*   开发环境  测试环境  生产环境
* */
@Configuration
public class MainConfigOfProfile {
    @Bean
    @Profile("default")
    public DataSource dataSource(){
        return null;
    }
}
