package com.tx;

import com.mchange.v2.c3p0.ComboPooledDataSource;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import org.springframework.transaction.annotation.Transactional;

import javax.sql.DataSource;
import javax.xml.crypto.Data;
import java.beans.PropertyVetoException;

/**
 * @author chen
 * @date 2019/5/20--8:42
 */
/*
* 环境搭建:
* 1.导入相关依赖
*   数据源,数据库驱动,Spring-jdbc模块
* 2.配置数据源:JdbcTemplate(Spring提供的简化数据库操作的工具)操作数据
* 3.给方法上标注@Transactional表示当前方法是一个事务方法
* 4.@EnableTransactionManagement开启基于注解的事务管理功能
* 5.配置事务管理器来控制事务
*       @Bean
        public PlatformTransactionManager transactionManager()
*
*
* */
@EnableTransactionManagement
@Configuration
public class TxConfig {
    //数据源
    @Bean
    public DataSource dataSource() throws PropertyVetoException {
        ComboPooledDataSource dataSource = new ComboPooledDataSource();
        dataSource.setUser("root");
        dataSource.setPassword("123456");
        dataSource.setDriverClass("com.mysql.jdbc.Driver");
        dataSource.setJdbcUrl("jdbc:mysql://localhost:3306/blog");
        return dataSource;
    }
    @Bean
    public JdbcTemplate jdbcTemplate() throws PropertyVetoException {
        //spring对@Configuration类会特殊处理,给容器中添加组件的方法,多次调用都只是从容器中找组件
        JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource());
        return jdbcTemplate;
    }
    //注册事务管理器在容器中
    @Bean
    public PlatformTransactionManager transactionManager() throws PropertyVetoException {
        return new DataSourceTransactionManager(dataSource());
    }
}
