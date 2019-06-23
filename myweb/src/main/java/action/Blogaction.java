package action;

import entity.Blog;
import entity.User;
import entity.page;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.AlternativeJdkIdGenerator;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import service.Blogservice;

import javax.jws.soap.SOAPBinding;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

@Controller
public class Blogaction {
    @Autowired
    private Blogservice service;

    public Blogservice getService() {
        return service;
    }

    public void setService(Blogservice service) {
        this.service = service;
    }

    /*页面加载之初查询所有博客并分页*/
    @ResponseBody
    @RequestMapping("/queryall")
    public page<Blog> queryall(HttpServletRequest request, HttpServletResponse response) {
        String startindex = request.getParameter("startindex");
        Integer pagenum = Integer.parseInt(startindex);
        Integer pagesize = 3;
        page<Blog> page = service.queryall(pagenum, pagesize);
        System.out.println(page);
        return page;
    }

    /*搜索框搜索博客分页*/
    @ResponseBody
    @RequestMapping("/find")
    public page<Blog> find(HttpServletRequest request, HttpServletResponse response) {
        String event = request.getParameter("event");
        String startindex = request.getParameter("startindex");
        Integer pagenum = Integer.parseInt(startindex);
        Integer pagesize = 6;
        System.out.println(startindex);
        page<Blog> page;
        if (event == "") {
            page = service.queryall(pagenum, pagesize);
        } else {
            page = service.find(event, pagenum, pagesize);
        }
        System.out.println(page);
        return page;
    }

    /*获取当前用户名*/
    public String getuser(HttpServletRequest request, HttpServletResponse response) {
        Cookie[] cookies = request.getCookies();
        String value = "";
        if (cookies != null && cookies.length > 0) {
            for (int i = 0; i < cookies.length; i++) {
                if (cookies[i].getName().equals("username")) {
                    value = cookies[i].getValue();
                    break;
                }
            }
        }
        return value;
    }

    /*插入一条博客*/
    @RequestMapping("/insert")
    @ResponseBody
    public boolean insert(HttpServletRequest request, HttpServletResponse response) {
        String content = request.getParameter("content");
        String sign = request.getParameter("sign");
        String lable = request.getParameter("lable");
        String type = request.getParameter("type");
        String username = getuser(request, response);
        User user = (User) request.getSession().getAttribute("user");
        Blog blog = new Blog(user.getName(), sign, content, type, "chen", lable, user.getUid(), "");
        Integer flog = service.insert(blog);
        System.out.println(flog);
        if (flog == 1) {
            return true;
        } else {
            return false;
        }
    }

    /*查询所有博客type*/
    @RequestMapping("/querytypeall")
    @ResponseBody
    public Map<String, Integer> querytypeall(HttpServletRequest request, HttpServletResponse response) {
        Map<String, Integer> map = service.querytypeall();
        System.out.println(map);
        return map;
    }

    /*查询每种type的数量*/
    @ResponseBody
    @RequestMapping("/queryoneall")
    public Integer queryoneall(HttpServletRequest request, HttpServletResponse response) {
        String type = request.getParameter("type");
        System.out.println(type);
        Integer i = service.queryoneall(type);
        return i;
    }

    /*查询所有博客标签*/
    @RequestMapping("/queryalllable")
    @ResponseBody
    public List<String> queryalllable(HttpServletRequest request, HttpServletResponse response) {
        List<String> list = service.queryalllable();
        System.out.println(list);
        return list;
    }

    /*写博客页面    选择新写博客所属type*/
    @ResponseBody
    @RequestMapping("/type")
    public List<String> querytypeall() {
        List<String> list = service.querytype();
        System.out.println(list);
        return list;
    }

    /*上传图片*/
    @ResponseBody
    @RequestMapping("/upload")
    public Map<String, String> insertimage(@RequestParam("file") MultipartFile file, HttpServletRequest request, HttpServletResponse response) throws IOException {
        System.out.println("true");
        System.out.println(file);
        //得到文件名
        String filename = file.getOriginalFilename();
        System.out.println(filename);
        //文件名后缀
        String filePrefixname = filename.substring(filename.lastIndexOf("."));
        //用uuid作为文件名
        String newfilename = UUID.randomUUID() + filePrefixname;
        System.out.println(newfilename);
        //保存到本地的文件夹
        String savepath = "E:\\IDEA\\workspace\\myweb\\src\\main\\webapp\\picture";
        /*服务器地址
         * String savepath="/www/server/tomcat/webapps/myweb/image";*/
        /*本地地址*/
        /*E:\IDEA\workspace\myweb\src\main\webapp\picture*/
        //转换成file
        byte[] bytes = file.getBytes();
        File photopath = new File(savepath);
        if (!photopath.exists()) {
            photopath.mkdir();
        }
        //保存到本地
        File photo = new File(savepath, newfilename);
        FileCopyUtils.copy(bytes, photo);
        System.out.println(photo);
        //回显路径
        /*服务器
         * String showpath="image"+"/"+newfilename;*/
        /*本地地址
         * String showpath="/picture"+"/"+newfilename;*/
        String showpath = "/picture" + "/" + newfilename;
        System.out.println(showpath);
        Map<String, String> map = new HashMap<>();
        /*E:\Tomcat\apache-tomcat-7.0.64-windows-x64\apache-tomcat-7.0.64\webapps\myweb\pic\a8435d73-b8a6-4151-8901-4a23d705d75d.jpg*/
        map.put("url", showpath);
        return map;
    }

    /*依据lable查询博客*/
    @RequestMapping("/findlable")
    @ResponseBody
    public page<Blog> findlable(HttpServletRequest request, HttpServletResponse response) {
        String lable = request.getParameter("lable");
        System.out.println(lable);
        String startindex = request.getParameter("startindex");
        Integer pagenum = Integer.parseInt(startindex);
        Integer pagesize = 6;
        page<Blog> page = service.findlable(lable, pagenum, pagesize);
        System.out.println(page);
        return page;
    }

    /*依据type查询博客*/
    @RequestMapping("/findtype")
    @ResponseBody
    public page<Blog> findtype(HttpServletRequest request, HttpServletResponse response) {
        /*
        *     String event = request.getParameter("event");
        String startindex = request.getParameter("startindex");
        Integer pagenum = Integer.parseInt(startindex);
        Integer pagesize = 6;
        page<Blog> page;
        if (event==""){
            page = service.queryall(pagenum, pagesize);
        }else {
            page = service.find(event, pagenum, pagesize);
        }
        System.out.println(page);*/
        String type = request.getParameter("type");
        System.out.println(type);
        String startindex = request.getParameter("startindex");
        Integer pagenum = Integer.parseInt(startindex);
        Integer pagesize = 6;
        page<Blog> page = service.findtype(type, pagenum, pagesize);
        System.out.println(page);
        return page;
    }

    @ResponseBody
    @RequestMapping(value = "/showcontent")
    public Map<String, Blog> showcontent(HttpServletRequest request, HttpServletResponse response) {
        String sign = request.getParameter("sign");
        System.out.println(sign);
        Blog blog = service.showcontent(sign);
        Map<String, Blog> map = new HashMap<>();
        map.put("blog", blog);
        System.out.println(blog);
        return map;
    }
}


