package cn.kgc.mapper;

import cn.kgc.domain.totalist;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface totalistMapper {
   
    int insertTo(totalist record);
    List<totalist> selectallbyId(Integer userid);

}