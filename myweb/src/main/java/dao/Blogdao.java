package dao;

import entity.Blog;
import entity.User;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface Blogdao {
    //插入一条博客
    public Integer insert(Blog blog);

    //在特定条件下分页
    public List<Blog> query(@Param(value = "event") String event, @Param(value = "startindex") Integer startindex, @Param(value = "pagesize") Integer pagesize);

    //查询所有博客
    public List<Blog> queryall();

    //博客分页
    public List<Blog> querypage(@Param(value = "startindex") Integer startindex, @Param(value = "pagesize") Integer pagesize);

    //动态sql查询
    public List<Blog> find(@Param(value = "event") String event);

    //查询所有博客分类(去除重复)
    public List<String> querytypeall();

    //查询每个博客分类的总数
    public Integer queryone(@Param(value = "parameter") String parameter);

    /*查询所有博客标签*/
    public List<String> queryalllable();

    /*依据lable查询博客*/
    public List<Blog> findlable(@Param("lable") String lable);

    /*依据lable查询博客*/
    public List<Blog> querylable(@Param("lable") String lable, @Param("startindex") Integer startindex, @Param("pagesize") Integer pagesize);

    /*依据type查询博客*/
    public List<Blog> findtype(@Param("type") String type);

    /*依据type查询分页*/
    public List<Blog> querytype(@Param("type") String type, @Param("startindex") Integer startindex, @Param("pagesize") Integer pagesize);

    /*显示博客内容*/
    public Blog showcontent(@Param("sign") String sign);
}
