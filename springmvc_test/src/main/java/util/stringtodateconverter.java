package util;

import org.springframework.core.convert.converter.Converter;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * @author chen
 * @date 2019/5/22--20:36
 */
/*
* 把字符串转换成日期
* */
public class stringtodateconverter implements Converter<String, Date> {
    /*
    * 判断传入的字符串是否为空
    * */
    @Override
    public Date convert(String s) {
        Date date;
        if (s==null){
            throw new RuntimeException("请您传入数据");
        }
        DateFormat df=new SimpleDateFormat("yyyy-MM-dd");
        try {
            //把字符串转换成日期
            date = df.parse(s);
        } catch (ParseException e) {
            throw new RuntimeException("数据类型转换出现异常");
        }
        return date;
    }
}
