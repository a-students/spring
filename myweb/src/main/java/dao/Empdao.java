package dao;

import entity.emp;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface Empdao {
    public List<emp> finallemp();

    public List<emp> finall(@Param(value = "startindex") Integer startindex, @Param(value = "pagesize") Integer pagesize);
}
