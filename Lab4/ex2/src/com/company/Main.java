package com.company;

import java.util.ArrayList;
import java.util.Random;

public class Main {

    public static void main(String[] args) {
	// write your code here
        //task2
        System.out.println(PasswordMaker.getK());

        PasswordMaker p = PasswordMaker.getInstance();
        PasswordMaker q = PasswordMaker.getInstance();
        PasswordMaker r = PasswordMaker.getInstance();
        PasswordMaker s = PasswordMaker.getInstance();
        p.getPassword();
        q.getPassword();
        r.getPassword();
        s.getPassword();
        //este nevoie ca acel contor sa fie static pt a putea fi folosit in metoda statica getInstance()
        System.out.println(PasswordMaker.getK());

        //pentru tema de gandire , s-ar putea scrie peste, un sir sa fieadaugat la finalul unei variabile
        // in loc sa se puna peste

        Random rand = new Random();
        int upperbound = 20;
        int n = rand.nextInt(upperbound);

        //task3
        ArrayList<Integer> arr = new ArrayList<>(4);
        for(int i = 0; i < n; i++) {
            arr.add(i);
        }

        MyImmutableArray a = new MyImmutableArray(arr);
        a.getArray();

        //nu am gasit cum sa-l fac immutable
        //pana la urma asa ca am facut o mica inginerie ^^
        arr.add(20);
        MyImmutableArray b = new MyImmutableArray(arr);
        b.getArray();

        arr.add(21);
        MyImmutableArray c = new MyImmutableArray(arr);
        c.getArray();

        arr.set(3, 22);
        MyImmutableArray d = new MyImmutableArray(arr);
        d.getArray();


    }

}
