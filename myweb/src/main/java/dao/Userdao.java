package dao;

import entity.User;
import org.apache.ibatis.annotations.Param;

import javax.jws.soap.SOAPBinding;

public interface Userdao {
    //用户名验证
    public int queryall(String username);

    //用户校验
    public int query(@Param(value = "username") String username, @Param(value = "password") String password);

    //注册用户的操作,将用户的邮箱和验证码存入数据库中
    public void storage(@Param(value = "email") String email, @Param(value = "code") String code);

    //查找激活码,返回用户名
    public User findBycode(@Param("email") String email, @Param("code") String code);

    //查找到激活码,更新数据库中数据
    public void update(User user);

    //注册时用户名校验
    public Integer registerqueryusername(String username);

    //注册时邮箱校验
    public Integer registerqueryemail(String email);

    //找回密码
    public void setcode(@Param("email") String email, @Param("code") String code);

    public String findpw(String username);

    //修改头像
    public void saveimage(@Param("image") String image, @Param("id") Integer id);

    //页面加载之初获取头像信息
    public String showimage(@Param("id") Integer id);

    //修改用户基本信息
    public Integer setinformation(@Param("id") Integer id, @Param("name") String name, @Param("sex") String sex, @Param("birthday") String birthday, @Param("address") String address);

    //显示用户基本信息
    public User showinformation(@Param("id") Integer id);

    //用户登录成功后获取用户头像
    public String getimage(@Param("username") String username);

    /*获取用户信息存入session*/
    public User getuser(@Param("username") String username, @Param("password") String password);

    public User queryuser(@Param("username") String username);
}
