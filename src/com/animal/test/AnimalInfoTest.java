package com.animal.test;

import java.util.ArrayList;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.animal.model.AnimalInfo;
import com.animal.service.AnimalInfoService;



@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"classpath:applicationContext.xml" })
public class AnimalInfoTest {
    @Autowired
    private AnimalInfoService animalInfoService;

    @Autowired
    private AnimalInfo animalInfo;

    //测试根据id获取动物数据
    @Test
    public void testGetAnimalInfoByAnimalId() {
    	animalInfo = animalInfoService.getAnimalInfoByAnimalId("uuid55");
//    	System.out.println(animalInfo.toString());
    }
    
    //测试根据id获取动物数据
    @Test
    public void testSeachAnimalByWords() {
    	ArrayList<AnimalInfo> arrayListAnimalInfo = new ArrayList<AnimalInfo>();
    	arrayListAnimalInfo = animalInfoService.seachAnimalByWords("龙");
    	System.out.println(arrayListAnimalInfo.toString());
    }
}