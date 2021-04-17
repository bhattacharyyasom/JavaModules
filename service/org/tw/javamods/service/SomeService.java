package org.tw.javamods.service;

import java.util.*;
import org.tw.javamods.data.SomeData;

public class SomeService {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        String str= scanner.nextLine();

        if(str.equals("data")){
            SomeData sData = new SomeData();
            System.out.println("In Service running inside : "+SomeService.class.getModule());
            System.out.println("Call for data \n");
            System.out.println("Receive data \n"+sData.getSomeData());
            System.out.println("-----------Done---------- \n");
        }else{
            System.out.println("Safer part of the code possibly");
        }
    }
}
