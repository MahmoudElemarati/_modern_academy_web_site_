package com.modern.www._1_2_MySql_DB_entities;
// Generated Mar 29, 2021 8:57:57 PM by Hibernate Tools 4.3.1


import javax.persistence.Column;
import javax.persistence.Embeddable;

/**
 * A0055StudentsCoursesId generated by hbm2java
 */
@Embeddable
public class A0055StudentsCoursesId  implements java.io.Serializable {


     private int courseId;
     private String courseCode;
     private int listId;
     private int stdId;
     private int yearId;
     private int semesterId;

    public A0055StudentsCoursesId() {
    }

    public A0055StudentsCoursesId(int courseId, String courseCode, int listId, int stdId, int yearId, int semesterId) {
       this.courseId = courseId;
       this.courseCode = courseCode;
       this.listId = listId;
       this.stdId = stdId;
       this.yearId = yearId;
       this.semesterId = semesterId;
    }
   


    @Column(name="course_id", nullable=false)
    public int getCourseId() {
        return this.courseId;
    }
    
    public void setCourseId(int courseId) {
        this.courseId = courseId;
    }


    @Column(name="course_code", nullable=false, length=10)
    public String getCourseCode() {
        return this.courseCode;
    }
    
    public void setCourseCode(String courseCode) {
        this.courseCode = courseCode;
    }


    @Column(name="list_id", nullable=false)
    public int getListId() {
        return this.listId;
    }
    
    public void setListId(int listId) {
        this.listId = listId;
    }


    @Column(name="std_id", nullable=false)
    public int getStdId() {
        return this.stdId;
    }
    
    public void setStdId(int stdId) {
        this.stdId = stdId;
    }


    @Column(name="year_id", nullable=false)
    public int getYearId() {
        return this.yearId;
    }
    
    public void setYearId(int yearId) {
        this.yearId = yearId;
    }


    @Column(name="semester_id", nullable=false)
    public int getSemesterId() {
        return this.semesterId;
    }
    
    public void setSemesterId(int semesterId) {
        this.semesterId = semesterId;
    }


   public boolean equals(Object other) {
         if ( (this == other ) ) return true;
		 if ( (other == null ) ) return false;
		 if ( !(other instanceof A0055StudentsCoursesId) ) return false;
		 A0055StudentsCoursesId castOther = ( A0055StudentsCoursesId ) other; 
         
		 return (this.getCourseId()==castOther.getCourseId())
 && ( (this.getCourseCode()==castOther.getCourseCode()) || ( this.getCourseCode()!=null && castOther.getCourseCode()!=null && this.getCourseCode().equals(castOther.getCourseCode()) ) )
 && (this.getListId()==castOther.getListId())
 && (this.getStdId()==castOther.getStdId())
 && (this.getYearId()==castOther.getYearId())
 && (this.getSemesterId()==castOther.getSemesterId());
   }
   
   public int hashCode() {
         int result = 17;
         
         result = 37 * result + this.getCourseId();
         result = 37 * result + ( getCourseCode() == null ? 0 : this.getCourseCode().hashCode() );
         result = 37 * result + this.getListId();
         result = 37 * result + this.getStdId();
         result = 37 * result + this.getYearId();
         result = 37 * result + this.getSemesterId();
         return result;
   }   


}


