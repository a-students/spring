package service;

import entity.emp;
import entity.page;

import java.util.List;

public interface empservice {
    public page<emp> findall(Integer pagenum, Integer pagesize);
}
