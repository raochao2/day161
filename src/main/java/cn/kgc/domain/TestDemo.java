package cn.kgc.domain;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

public class TestDemo {
    public static void main(String[] args) {
        System.out.println("测试Lamada表达式");
        new Thread(
                ()->{
                    System.out.println("开始多线程！");
                }
        ).start();
        System.out.println("其他的运行程序。");
        new Thread(
                ()->{
                    System.out.println("开始2多线程！");
                }
        ).start();
        new Thread(
                ()->{
                    System.out.println("开始3多线程！");
                }
        ).start();
    }
    ArrayList  list= new ArrayList();

}
