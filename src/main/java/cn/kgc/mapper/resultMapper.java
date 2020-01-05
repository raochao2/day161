package cn.kgc.mapper;

import cn.kgc.domain.people;
import cn.kgc.domain.result;

import java.util.List;

public interface resultMapper {
   //增加数据
    int insert(result record);
  //查询所有的数据
    List<result> selectAll();

}
