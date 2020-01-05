package cn.kgc.service;

import cn.kgc.domain.people;

public interface peopleServie {
   people findPeople(String id);
   int modifiMoney(people people);
}
