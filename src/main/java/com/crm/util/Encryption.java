package com.crm.util;

import java.security.MessageDigest;  
import java.security.NoSuchAlgorithmException;  
  
public class Encryption {  
  
    public static String md5(String str){  
        if(str == null || str.length() == 0){  
            return null;  
        }else{  
            MessageDigest MD5 = null;  
            try{  
                MD5 = MessageDigest.getInstance("md5");  //获取md5加密方法实例  
            }catch(NoSuchAlgorithmException e){  
                e.printStackTrace();  
                return null;  
            }  
  
            /*将byte类型转换为string类型，方便操作*/  
            byte[] t = MD5.digest(str.getBytes());  
            StringBuilder res = new StringBuilder();  
            for(byte tt : t){  
                String hex = Integer.toHexString(tt & 0xff);  
                if(hex.length() == 1){  
                    hex = "0" + hex;  
                }  
                res.append(hex);  
            }  
            return res.toString();  
        }  
    }  
    public static void main(String[] args) {  
        System.out.println(md5("123"));  
    }  
  
}  