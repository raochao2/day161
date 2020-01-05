package cn.kgc.mapper;


import cn.kgc.domain.people;

public interface peopleMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(people record);

    int insertSelective(people record);

    people selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(people record);

    int updateByPrimaryKey(people record);
}