package com.company;

import java.util.ArrayList;
//import java.util.List;
//import java.util.Collections;
//import java.util.List;

public class MyImmutableArray {

    private static ArrayList<Integer> immutableArray = new ArrayList<>(4);
    private static int k = 0;

    public MyImmutableArray(ArrayList<Integer> array) {
        if (k == 0) {
            immutableArray.addAll(array);
        }
    }

    public void getArray() {
            for (Integer integer : immutableArray) {
                System.out.println(integer);
            }
            k = 1;
    }
}
