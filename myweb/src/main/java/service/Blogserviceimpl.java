package service;

import dao.Blogdao;
import dao.Userdao;
import entity.Blog;
import entity.User;
import entity.page;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.swing.text.StyledEditorKit;
import java.util.*;

@Transactional
@Service("blogservice")
public class Blogserviceimpl implements Blogservice {
    @Autowired
    private Blogdao blogdao;

    public Blogdao getBlogdao() {
        return blogdao;
    }

    public void setBlogdao(Blogdao blogdao) {
        this.blogdao = blogdao;
    }

    /* public page<Blog> queryall(Integer pagenum,Integer pagesize){
     *//*
        * List<emp> alllist=userdao.finallemp();
        int totalrecord=alllist.size();
        page p=new page(pagenum,pagesize,totalrecord);
        Integer startindex=p.getStartindex();
        p.setList(userdao.finall(startindex,pagesize));
        System.out.println(p.getList());
        System.out.println(p);*//*
        List<Blog> list=blogdao.query();
        Integer totalrecord=list.size();
        page page=new page(pagenum,pagesize,totalrecord);
        Integer startindex=page.getStartindex();
        page.setList(blogdao.querypage(startindex,pagesize));
        System.out.println(page.getList());
        System.out.println(page);
        return page;
    }*/
    public Integer insert(Blog blog) {
        Integer flog = blogdao.insert(blog);
        return flog;
    }

    /* public Blog query(String blog_sign){
         Blog blog=blogdao.query(blog_sign);
         return blog;
     }*/
    public page<Blog> queryall(Integer pagenum, Integer pagesize) {
        List<Blog> list = blogdao.queryall();
        Integer totalrecord = list.size();
        page page = new page(pagenum, pagesize, totalrecord);
        Integer startindex = page.getStartindex();
        page.setList(blogdao.querypage(startindex, pagesize));
        System.out.println(page.getList());
        return page;
    }

    public page<Blog> find(String event, Integer pagenum, Integer pagesize) {
        List<Blog> list = blogdao.find(event);
        System.out.println(list);
        Integer totalrecord = list.size();
        page page = new page(pagenum, pagesize, totalrecord);
        Integer startindex = page.getStartindex();
        page.setList(blogdao.query(event, startindex, pagesize));
        System.out.println(page.getList());
        return page;
    }

    //查询每种博客的数量
    public Integer queryoneall(String parameter) {
        Integer i = blogdao.queryone(parameter);
        return i;
    }

    //查询所有博客种类(主页)
    public Map<String, Integer> querytypeall() {
        List<String> list = blogdao.querytypeall();
        Map<String, Integer> map = new HashMap<String, Integer>();
        for (String i : list) {
            Integer size = blogdao.queryone(i);
            map.put(i, size);
        }
        System.out.println(map);
        return map;
    }

    /*查询所有博客标签*/
    public List<String> queryalllable() {
        return blogdao.queryalllable();
    }

    /*查询所有博客type*/
    public List<String> querytype() {
        return blogdao.querytypeall();
    }

    /*依据lable查询博客*/
    public page<Blog> findlable(String lable, Integer pagenum, Integer pagesize) {
        List<Blog> list = blogdao.findlable(lable);
        System.out.println(list);
        Integer totalrecord = list.size();
        System.out.println(totalrecord);
        page page = new page(pagenum, pagesize, totalrecord);
        Integer startindex = page.getStartindex();
        page.setList(blogdao.querylable(lable, startindex, pagesize));
        System.out.println(page.getList());
        return page;
    }

    /*依据type查询博客*/
    public page<Blog> findtype(String type, Integer pagenum, Integer pagesize) {
        List<Blog> list = blogdao.findtype(type);
        System.out.println(list);
        Integer totalrecord = list.size();
        page page = new page(pagenum, pagesize, totalrecord);
        Integer startindex = page.getStartindex();
        page.setList(blogdao.querytype(type, startindex, pagesize));
        System.out.println(page.getList());
        return page;
    }

    /*显示博客内容*/
    public Blog showcontent(String sign) {
        Blog blog = blogdao.showcontent(sign);
        return blog;
    }
}
