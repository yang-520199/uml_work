package com.deo;
import java.io.Serializable;
public class user implements Serializable{
    private  int userid;
    private String username;
    private String password;
    private String sex;
    private  String realname;
    private String email;

    public int getUserid(){return userid;}
    public void setUserid(int userid){this.userid= userid;}
    public String getUsername(){return username;}
    public void setUsername(String username){this.username= username;}
    public String getPassword(){return password;}
    public void setPassword(String password){this.password= password;}
    public String getSex(){return sex;}
    public void setSex(String sex){this.sex=sex;}
    public String getRealname(){return realname;}
    public void  setRealname(String realname){this.realname=realname;}
    public String getEmail(){return email;}
    public void setEmail(String email){this.email=email;}
}
