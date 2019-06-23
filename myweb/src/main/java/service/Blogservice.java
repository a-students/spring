package service;

import entity.Blog;
import entity.User;
import entity.page;

import java.util.List;
import java.util.Map;


public interface Blogservice {
    //插入一条博客
    public Integer insert(Blog blog);

    //根据条件查询博客
    //public page<Blog> query(String event,Integer startindex,Integer pagesize);
    //分页查询博客
    public page<Blog> queryall(Integer pagenum, Integer pagesize);

    //动态sql分页查询
    public page<Blog> find(String event, Integer pagenum, Integer pagesize);

    //显示每一个博客分类的总数
    public Integer queryoneall(String parameter);

    //查询所有博客种类
    public Map<String, Integer> querytypeall();

    /*查询所有博客标签*/
    public List<String> queryalllable();

    /*查询所有博客type*/
    public List<String> querytype();

    /*依据type查询博客*/
    public page<Blog> findlable(String lable, Integer pagenum, Integer pagesize);

    /*依据lable查询博客*/
    public page<Blog> findtype(String type, Integer pagenum, Integer pagesize);

    /*显示博客内容*/
    public Blog showcontent(String sign);
}
