package com.company;

//import java.util.Random;

import java.util.Random;

public class PasswordMaker {

    private static PasswordMaker single_instance;
    private static final int MAGIC_NUMBER = 29;
    char[] chars = "abcdefghijklmnopqrstuvwxyz".toCharArray();
    private static final StringBuilder Password = new StringBuilder(35);
    private static final StringBuilder MAGIC_STRING = new StringBuilder(25);
    Random random = new Random();
    char[] chars1 = new char[25];
    private static int k;
    public String nume;

    static {
        single_instance = null;
        k = 0;
    }

    private PasswordMaker() {
        nume = "NorocAndrei";
        for (int i = 0; i < 25; i++) {
            char c = chars[random.nextInt(chars.length)];
            MAGIC_STRING.append(c);
        }
        Password.append(MAGIC_STRING);
        for (int i = 0; i < nume.length(); i++) {
            chars1[i] = nume.charAt(i);
        }
        for (int i = 0; i < 10; i++) {
            char c = chars1[random.nextInt(chars1.length)];
            Password.append(c);
        }
        char ch = (char)MAGIC_NUMBER;
        Password.append(ch);
    }

    public static PasswordMaker getInstance() {
          k++;
          if(single_instance == null) {
              single_instance = new PasswordMaker();
          }
          return  single_instance;
    }

    public void getPassword() {
        System.out.println(Password);
    }

    public static int getK() {
        return k;
    }
}