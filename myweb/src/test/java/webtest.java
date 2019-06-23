
import dao.Blogdao;
import dao.Userdao;
import entity.Blog;

import entity.emp;
import entity.page;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import service.Blogservice;
import service.Userservice;
import service.empservice;


import java.io.IOException;
import java.io.InputStreamReader;

import java.io.Reader;
import java.util.List;

public class webtest {
    @Test
    public void test1() {
        ApplicationContext context = new ClassPathXmlApplicationContext("/applicationContext.xml");
        Userservice userservice = (Userservice) context.getBean("service");
        boolean blog = userservice.queryall("12");
        System.out.println(blog);

    }

    @Test
    public void test2() {
        ApplicationContext context = new ClassPathXmlApplicationContext("/applicationContext.xml");
        Userdao userdao = (Userdao) context.getBean("userdao");
        Integer i = userdao.queryall("12");
        System.out.println(i);
    }

    @Test
    public void test3() {
        ApplicationContext context = new ClassPathXmlApplicationContext("applicationContext.xml");
        empservice service = (empservice) context.getBean("empservice");
        page<emp> page = service.findall(1, 3);
        System.out.println(page);
    }

    @Test
    public void test5() {
        ApplicationContext context = new ClassPathXmlApplicationContext("applicationContext.xml");
        Userservice service = (Userservice) context.getBean("service");
        boolean blog = service.send("2440836638@qq.com");
        System.out.println(blog);
    }

    @Test
    public void test6() {
        ApplicationContext context = new ClassPathXmlApplicationContext("/applicationContext.xml");
        Userdao userdao = (Userdao) context.getBean("userdao");
        Integer i = userdao.registerqueryusername("123456789");
        System.out.println(i);
    }

    @Test
    public void test7() {
        ApplicationContext context = new ClassPathXmlApplicationContext("/applicationContext.xml");
        Userservice service = (Userservice) context.getBean("service");
        boolean blog = service.registerusername("123456789");
        System.out.println(blog);
    }

    @Test
    public void test8() {
        ApplicationContext context = new ClassPathXmlApplicationContext("/applicationContext.xml");
        Blogservice blogservice = (Blogservice) context.getBean("blogservice");
        blogservice.insert(new Blog("chen", "chen", "chen", "chen", "chen", "chen", 12, ""));
    }

    /*    @Test
        public void test9(){
            ApplicationContext context=new ClassPathXmlApplicationContext("/applicationContext.xml");
            Blogservice blogservice=(Blogservice) context.getBean("blogservice");
            Blog blog=blogservice.query("chen");
            System.out.println(blog);
        }*/
    @Test
    public void test10() {
        ApplicationContext context = new ClassPathXmlApplicationContext("/applicationContext.xml");
        Blogservice blogservice = (Blogservice) context.getBean("blogservice");
        page<Blog> page = blogservice.queryall(2, 5);
        System.out.println(page);
    }

    @Test
    public void test11() {
        ApplicationContext context = new ClassPathXmlApplicationContext("/applicationContext.xml");
        Blogservice blogservice = (Blogservice) context.getBean("blogservice");
        page<Blog> list = blogservice.find("zxx", 1, 3);
        System.out.println(list);
    }

    @Test
    public void test12() {
        ApplicationContext context = new ClassPathXmlApplicationContext("/applicationContext.xml");
        Blogdao dao = (Blogdao) context.getBean("blogdao");
        List<Blog> list = dao.find("chen");
        System.out.println(list);
    }

    @Test
    public void test13() {
        ApplicationContext context = new ClassPathXmlApplicationContext("/applicationContext.xml");
        Blogdao dao = (Blogdao) context.getBean("blogdao");
        List<String> list = dao.querytypeall();
        System.out.println(list);
    }

    @Test
    public void test14() {
        ApplicationContext context = new ClassPathXmlApplicationContext("/applicationContext.xml");
        Blogservice blogservice = (Blogservice) context.getBean("blogservice");
        Integer i = blogservice.queryoneall("chen");
        System.out.println(i);
    }

    @Test
    public void test15() {
        ApplicationContext context = new ClassPathXmlApplicationContext("/applicationContext.xml");
        Blogdao dao = (Blogdao) context.getBean("blogdao");
        List<String> list = dao.queryalllable();
        System.out.println(list);
    }

    @Test
    public void test16() {
        ApplicationContext context = new ClassPathXmlApplicationContext("/applicationContext.xml");
        Blogservice blogservice = (Blogservice) context.getBean("blogservice");
        page<Blog> page = blogservice.findlable("zxx", 1, 3);
        System.out.println(page);
    }

    @Test
    public void test17() {
        ApplicationContext context = new ClassPathXmlApplicationContext("/applicationContext.xml");
        Blogservice blogservice = (Blogservice) context.getBean("blogservice");
        Blog blog = blogservice.showcontent("读书笔记--MySQL45讲");
        System.out.println(blog);
    }
}