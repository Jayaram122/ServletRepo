package com.lxisoft.internsassist;
import java.time.LocalDateTime;
import java.io.InputStream;
public class Internsassist
{
private String mail_id;
private String password;
private int points;
private String name;
private String atendence;
private String role_name;
private String date;
private int sl_no;
private String projectName;
private LocalDateTime datetime;
private String status;
private String phone;
private InputStream img;  
private String realName;

public Internsassist(String name, LocalDateTime datetime, String status) {
    this.name = name;
    this.datetime = datetime;
    this.status = status;
}
public Internsassist() {

}

public LocalDateTime getDatetime() {
    return datetime;
}

public String getStatus() {
    return status;
}

public void setMail_id(String mail_id)
{
    this.mail_id = mail_id;
}

public String getMail_id()
{
    return mail_id;
}

public void setPassword(String password)
{
    this.password = password;
}

public String getPassword()
{
    return password;
}
public int getPoints() {
    return points;
}

public void setPoints(int points) {
    this.points = points;
}

public String getName() {
    return name;
}

public void setName(String name) {
    this.name = name;
}

public void setAtendence(String atendence)
{
    this.atendence = atendence;
}

public String getAtendence()
{
    return atendence;
}

public void setRole_name(String role_name)
{
    this.role_name = role_name;
}

public String getRole_name()
{
    return role_name;
}

public void setDate(String date)
{
    this.date = date;
}

public String getDate()
{
    return date;
}

public int getSl_no() {
    return sl_no;
}

public void setSl_no(int sl_no) {
    this.sl_no = sl_no;
}

public void setProjectName(String projectName) {
     this.projectName =  projectName;
}

public String getProjectName() {
    return projectName;
}

public String getPhone() {
    return phone;
}
public void setPhone(String phone) {
    this.phone = phone;
}

public void setInputstream(InputStream img)
{
  this.img = img;
}

public InputStream getInputstream()
{
    return img;
}

public void setRealName(String realName)
{
  this.realName = realName;
}

public String getRealName()
{
    return realName;
}

}