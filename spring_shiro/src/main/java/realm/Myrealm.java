package realm;

import com.sun.org.apache.bcel.internal.generic.NEW;
import org.apache.shiro.authc.*;
import org.apache.shiro.crypto.hash.SimpleHash;
import org.apache.shiro.realm.AuthenticatingRealm;
import org.apache.shiro.realm.Realm;
import org.apache.shiro.util.ByteSource;
import sun.security.krb5.Credentials;

import java.security.Principal;

/**
 * @author chen
 * @date 2019/7/4--13:25
 */
public class Myrealm extends AuthenticatingRealm{

    @Override
    protected AuthenticationInfo doGetAuthenticationInfo(
            AuthenticationToken authenticationToken) throws AuthenticationException {


        //1.把AuthenticationToken 转换为UsernamePasswordToken
        UsernamePasswordToken token=(UsernamePasswordToken) authenticationToken;


        //2.从UsernamePasswordToken中获取username
        String username = token.getUsername();


       //3.调用数据库方法,从数据库中查询username对应的用户记录
        System.out.println("从数据库中获取username"+username+"所对应的用户信息");


        //4.若用户不存在,则可以抛出UnKnownAccountException异常
        if ("unknown".equals(username)){
            throw new UnknownAccountException("用户不存在!");
        }


        //5.根据用户信息的情况,决定是否需要抛出其他异常

        //6.根据用户的情况,来构建AuthenticationInfo 对象并返回
        //  Principal:认证的实体信息,可以是username,也可以是数据表对应的用户的实体类对象
        // Credentials:密码
        //realmName:当前realm对象的name,调用父类的getName()方法即可
        Object Principal=username;
        Object Credentials=null;
        String realmName=getName();
        if ("admin".equals(username)){
            Credentials="038bdaf98f2037b31f1e75b5b4c9b26e";
        }
        if ("user".equals(username)){
           Credentials="098d2c478e9c11555ce2823231e02ec1";
        }
        ByteSource credentialsSalt= ByteSource.Util.bytes("user");
        SimpleAuthenticationInfo info =null;//= new SimpleAuthenticationInfo(Principal, Credentials, realmName);
        info=new SimpleAuthenticationInfo(Principal,Credentials,credentialsSalt,realmName);

        return info;
    }


    public static void main(String[] args) {
        String hashAlgorithmName="MD5";
        Object Credentials="123456";
        Object salt= ByteSource.Util.bytes("user");
        int hashiterations=1024;
        Object result = new SimpleHash(hashAlgorithmName, Credentials, salt, hashiterations);
        System.out.println(result);
    }











}
