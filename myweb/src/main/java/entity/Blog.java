package entity;

import java.io.Serializable;

public class Blog implements Serializable {

    //博客id号 唯一标识符
    private Integer blog_id;
    //博客所属人
    private String blog_people;
    //博客标题
    private String blog_sign;
    //博客内容
    private String blog_content;
    //博客所属类别
    private String blog_type;
    //博客内容简介
    private String blog_intro;
    //博客标签
    private String blog_lable;
    //博客外键  userid
    private Integer blog_user_id;
    //博客图片
    private String blog_image;

    public Blog() {
        super();
    }

    public Blog(String blog_people, String blog_sign, String blog_content, String blog_type, String blog_intro, String blog_lable, Integer blog_user_id, String blog_image) {
        this.blog_people = blog_people;
        this.blog_sign = blog_sign;
        this.blog_content = blog_content;
        this.blog_type = blog_type;
        this.blog_intro = blog_intro;
        this.blog_lable = blog_lable;
        this.blog_user_id = blog_user_id;
        this.blog_image = blog_image;
    }

    public String getBlog_image() {
        return blog_image;
    }

    public void setBlog_image(String blog_image) {
        this.blog_image = blog_image;
    }

    public Integer getBlog_id() {
        return blog_id;
    }

    public void setBlog_id(Integer blog_id) {
        this.blog_id = blog_id;
    }

    public String getBlog_people() {
        return blog_people;
    }

    public void setBlog_people(String blog_people) {
        this.blog_people = blog_people;
    }

    public String getBlog_sign() {
        return blog_sign;
    }

    public void setBlog_sign(String blog_sign) {
        this.blog_sign = blog_sign;
    }

    public String getBlog_content() {
        return blog_content;
    }

    public void setBlog_content(String blog_content) {
        this.blog_content = blog_content;
    }

    public String getBlog_type() {
        return blog_type;
    }

    public void setBlog_type(String blog_type) {
        this.blog_type = blog_type;
    }

    public String getBlog_intro() {
        return blog_intro;
    }

    public void setBlog_intro(String blog_intro) {
        this.blog_intro = blog_intro;
    }

    public String getBlog_lable() {
        return blog_lable;
    }

    public void setBlog_lable(String blog_lable) {
        this.blog_lable = blog_lable;
    }

    public Integer getBlog_user_id() {
        return blog_user_id;
    }

    public void setBlog_user_id(Integer blog_user_id) {
        this.blog_user_id = blog_user_id;
    }

    @Override
    public String toString() {
        return "Blog{" +
                "blog_id=" + blog_id +
                ", blog_people='" + blog_people + '\'' +
                ", blog_sign='" + blog_sign + '\'' +
                ", blog_content='" + blog_content + '\'' +
                ", blog_type='" + blog_type + '\'' +
                ", blog_intro='" + blog_intro + '\'' +
                ", blog_lable='" + blog_lable + '\'' +
                ", blog_user_id=" + blog_user_id +
                ", blog_image='" + blog_image + '\'' +
                '}';
    }
}
