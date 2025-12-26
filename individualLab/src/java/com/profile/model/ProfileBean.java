/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.profile.model;
import java.io.Serializable;
import java.sql.*;
/**
 *
 * @author syazw
 */
public class ProfileBean implements Serializable{
    private String studentID;
    private String name;
    private String email;
    private String program_code;
    private String program;
    private String hobbies;
    private String selfIntroduction;
    
    public ProfileBean() {
    }
    
    public ProfileBean (String studentID, String name, String email, String program_code, String program, String hobbies, String selfIntroduction){
        this.studentID = studentID;
        this.name = name;
        this.email = email;
        this.program_code = program_code;
        this.program = program;
        this.hobbies = hobbies;
        this.selfIntroduction = selfIntroduction;
    }
    
    public void setStudentID(String studentID) {
        this.studentID = studentID;
    }
    
    public void setName(String name){
        this.name = name;
    }
    
    public void setEmail(String email){
        this.email = email;
    }
    
    public void setProgram_code(String program_code){
        this.program_code = program_code;
    }
    
    public void setProgram(String program){
        this.program = program;
    }
    
    public void setHobbies(String hobbies){
        this.hobbies = hobbies;
    }
    
    public void setSelfIntroduction(String selfIntroduction){
        this.selfIntroduction = selfIntroduction;
    }
    
    public String getStudentID (){
        return studentID;
    }
        
    public String getName (){
        return name;
    }
    
    public String getEmail (){
        return email;
    }
    
    public String getProgram_code (){
        return program_code;
    }
    
    public String getProgram (){
        return program;
    }
    
    public String getHobbies (){
        return hobbies;
    }
    
    public String getSelfIntroduction (){
        return selfIntroduction;
    }
    
}
