package exception;

/**
 * @author chen
 * @date 2019/5/25--10:00
 */
/*
* 自定义异常类
* */
public class sysexception extends Exception{
    //存储提示信息
    private String message;

    public sysexception(String message) {
        super(message);
        this.message = message;
    }

    @Override
    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }
}
