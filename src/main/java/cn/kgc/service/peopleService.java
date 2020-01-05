package cn.kgc.service;

import cn.kgc.domain.people;
import cn.kgc.mapper.peopleMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class peopleService implements peopleServie {
 @Autowired
  private peopleMapper peoplemapper;

    @Override
    public people findPeople(String id) {
      Integer i=Integer.valueOf(id);
        cn.kgc.domain.people people = peoplemapper.selectByPrimaryKey(i);
        return people;
    }

    @Override
    public int modifiMoney(people people) {
        peoplemapper.updateByPrimaryKeySelective(people);
        return 1;
    }
}
