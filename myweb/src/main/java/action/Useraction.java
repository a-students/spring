package action;

import Until.CodeUntil;
import com.fasterxml.jackson.annotation.JsonTypeInfo;
import entity.User;
import entity.cookie;
import org.apache.shiro.web.session.HttpServletSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.AlternativeJdkIdGenerator;
import org.springframework.util.FileCopyUtils;
import org.springframework.util.SystemPropertyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import service.Userservice;
import service.Userviceimpl;

import javax.jws.soap.SOAPBinding;
import javax.mail.Session;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.sound.midi.Soundbank;
import javax.xml.ws.Response;
import java.io.File;
import java.io.IOException;
import java.util.*;

@Controller
public class Useraction {
    //private String code;
    @Autowired
    private Userviceimpl service;

    public Userviceimpl getUservice() {
        return service;
    }

    public void setUservice(Userviceimpl service) {
        this.service = service;
    }

    @RequestMapping("/loginusername")
    @ResponseBody
    public boolean queryusername(HttpServletRequest request) {
        String username = request.getParameter("username");
        boolean blog = service.queryall(username);
        return blog;
    }

    @ResponseBody
    @RequestMapping("/login")
    public boolean query(HttpServletRequest request, HttpServletResponse response) {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String remember = request.getParameter("remember");
        HttpSession session = request.getSession();
        session.setMaxInactiveInterval(30 * 60);
        User user = service.getuser(username, password);
        session.setAttribute("user", user);
        boolean blog = service.query(username, password);
        if (blog) {
            addcookie(username, remember, request, response);
        }
        return blog;
    }

    public void addcookie(String username, String remember, HttpServletRequest request, HttpServletResponse response) {
        Cookie cookie = new Cookie("username", username);
        cookie.setPath("/");
        if (remember == null || remember.equals("false")) {
            cookie.setMaxAge(0);
        } else {
            cookie.setMaxAge(60 * 60 * 24);
        }
        response.addCookie(cookie);
    }

    @ResponseBody
    @RequestMapping("/getcookie")
    public Map<String, String> getcookie(HttpServletRequest request, HttpServletResponse response) {
        Cookie[] cookies = request.getCookies();
        String value = "";
        HttpSession session = request.getSession();
        if (cookies != null && cookies.length > 0) {
            for (int i = 0; i < cookies.length; i++) {
                if (cookies[i].getName().equals("username")) {
                    value = cookies[i].getValue();
                    break;
                }
            }
        }
        session.setAttribute("user", service.queryuser(value));
        session.setMaxInactiveInterval(60 * 30);
        Map<String, String> map = new HashMap<String, String>();
        map.put("username", value);
        return map;
    }

    //发送QQ邮件,以获得激活码
    @ResponseBody
    @RequestMapping("/send")
    public void send(HttpServletRequest request, HttpServletResponse response) {
        String email = request.getParameter("email");
        boolean blog = service.send(email);
    }

    //账号激活(注册一个账号)
    @ResponseBody
    @RequestMapping(value = "/active")
    public String active(HttpServletRequest request, HttpServletResponse response) {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String email = request.getParameter("email");
        String code = request.getParameter("code");
        String name = request.getParameter("name");
        User user = service.findBycode(email, code);
        System.out.println(user);
        if (user != null) {
            user.setUsername(username);
            user.setPassword(password);
            user.setState("1");
            user.setCode(null);
            user.setName(name);
            System.out.println("已注册的" + user);
            service.update(user);
            return "true";
        } else {
            System.out.println("你的激活码有误");
            return "false";
        }
    }

    @ResponseBody
    @RequestMapping("/checkusername")
    public boolean checkusername(HttpServletRequest request, HttpServletResponse response) {
        String username = request.getParameter("username");
        boolean blog = service.registerusername(username);
        System.out.println(blog);
        return blog;
    }

    @ResponseBody
    @RequestMapping("/checkemail")
    public boolean checkemail(HttpServletRequest request, HttpServletResponse response) {
        return service.registeremail(request.getParameter("email"));
    }

    //找回密码
    //校验验证码
    public void setcode(HttpServletRequest request, HttpServletResponse response) {
        String email = request.getParameter("email");
        String code = request.getParameter("code");
        service.setcode(email, code);
    }

    @RequestMapping("/findpw")
    @ResponseBody
    public String findpw(HttpServletRequest request, HttpServletResponse response) {
        String username = request.getParameter("username");
        System.out.println(username);
        String email = request.getParameter("email");
        String code = request.getParameter("code");
        User user = service.findBycode(email, code);
        System.out.println(user);
        if (user == null) {
            System.out.println("邮箱或激活码有误");
            return "false";
        } else {
            String password = service.findpw("username");
            System.out.println(password);
            return password;
        }
    }

    @ResponseBody
    @RequestMapping(value = "/ajaxupload")
    public Map<String, String> ajax(@RequestParam(value = "file", required = false) MultipartFile file, HttpServletRequest request, HttpServletResponse response) throws IOException {
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
         * /www/server/tomcat/webapps/myweb/image*/
        /*本地地址*/
        /* String savepath="E:\\IDEA\\workspace\\myweb\\src\\main\\webapp\\picture";*/
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
        String showpath = "/picture" + "/" + newfilename;
        /*本地地址
         *String showpath="/picture"+"/"+newfilename; */
        /*服务器地址
         * String showpath="image"+"/"+newfilename;*/
        User user = (User) request.getSession().getAttribute("user");
        service.saveimage(showpath, user.getUid());
        System.out.println(showpath);
        Map<String, String> map = new HashMap<>();
        map.put("url", showpath);
        return map;
    }

    /*页面切换时session信息*/
    public User session(HttpServletRequest request, HttpServletResponse response) {
        HttpSession session = request.getSession();
        User user;
        if (session != null && session.getAttribute("user") != null) {
            user = (User) session.getAttribute("user");
            return user;
        } else {
            return null;
        }
    }

    @RequestMapping("/showimage")
    @ResponseBody
    public Map<String, String> showimage(HttpServletRequest request, HttpServletResponse response) {
        User user = session(request, response);
        String image = service.showimage(user.getUid());
        System.out.println("test" + user);
        Map<String, String> map = new HashMap<>();
        map.put("url", image);
        /*/image/ed0b7a2d-95b0-4fc8-a01a-da6a752b0cb5.jpg*/
        return map;
    }

    @ResponseBody
    @RequestMapping("/setinformation")
    public boolean setinformation(HttpServletRequest request, HttpServletResponse response) {
        String name = request.getParameter("name");
        String sex = request.getParameter("sex");
        String birthday = request.getParameter("birthday");
        String address = request.getParameter("address");
        System.out.println(address);
        System.out.println(name);
        User user = session(request, response);
        boolean blog = service.setinformation(user.getUid(), name, sex, birthday, address);
        return blog;
    }

    @RequestMapping("/showinformation")
    @ResponseBody
    public User showinformation(HttpServletRequest request, HttpServletResponse response) {
        User user = session(request, response);
        String name = request.getParameter(user.getName());
        User user1 = service.showinformation(user.getUid());
        System.out.println(user1);
        return user1;
    }

    /*用户登录后获取用户头像*/
    @ResponseBody
    @RequestMapping("/getimage")
    public Map<String, String> getimage(HttpServletRequest request, HttpServletResponse response) {
        String username = request.getParameter("username");
        System.out.println(username);
        String image = service.getiamge(username);
        System.out.println("image" + image);
        Map<String, String> map = new HashMap<>();
        map.put("image", image);
        return map;
    }
}