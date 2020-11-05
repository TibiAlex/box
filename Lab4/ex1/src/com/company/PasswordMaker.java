package com.company;

import java.util.Random;

public class PasswordMaker {

    private static final int MAGIC_NUMBER = 29;
    char[] chars = "abcdefghijklmnopqrstuvwxyz".toCharArray();
    private static final StringBuilder MAGIC_STRING = new StringBuilder(25);
    Random random = new Random();
    public String  nume;
    public int k = 25;

    public PasswordMaker(String name) {
         nume = name;
         k = name.length();
    }

    public void Constructor() {
        for (int i = 0; i < 25; i++) {
            char c = chars[random.nextInt(chars.length)];
            MAGIC_STRING.append(c);
        }
    }

    private static final StringBuilder Password = new StringBuilder(35);
    char[] chars1 = new char[k];
    public void transform() {
        for (int i = 0; i < k; i++) {
                   chars1[i] = nume.charAt(i);
        }
    }
    public void getPassword() {
        Constructor();
        Password.append(MAGIC_STRING);
        transform();
        for (int i = 0; i < 10; i++) {
            char c = chars1[random.nextInt(chars1.length)];
            Password.append(c);
        }
        char ch = (char)MAGIC_NUMBER;
        Password.append(ch);
        System.out.println(Password);
    }
}
