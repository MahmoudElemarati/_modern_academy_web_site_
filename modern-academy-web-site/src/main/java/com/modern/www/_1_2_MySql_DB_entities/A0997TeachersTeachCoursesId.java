package com.modern.www._1_2_MySql_DB_entities;
// Generated Mar 29, 2021 8:57:57 PM by Hibernate Tools 4.3.1


import javax.persistence.Column;
import javax.persistence.Embeddable;

/**
 * A0997TeachersTeachCoursesId generated by hbm2java
 */
@Embeddable
public class A0997TeachersTeachCoursesId  implements java.io.Serializable {


     private int courseId;
     private String courseCode;
     private int listId;
     private int teacherId;

    public A0997TeachersTeachCoursesId() {
    }

    public A0997TeachersTeachCoursesId(int courseId, String courseCode, int listId, int teacherId) {
       this.courseId = courseId;
       this.courseCode = courseCode;
       this.listId = listId;
       this.teacherId = teacherId;
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


    @Column(name="teacher_id", nullable=false)
    public int getTeacherId() {
        return this.teacherId;
    }
    
    public void setTeacherId(int teacherId) {
        this.teacherId = teacherId;
    }


   public boolean equals(Object other) {
         if ( (this == other ) ) return true;
		 if ( (other == null ) ) return false;
		 if ( !(other instanceof A0997TeachersTeachCoursesId) ) return false;
		 A0997TeachersTeachCoursesId castOther = ( A0997TeachersTeachCoursesId ) other; 
         
		 return (this.getCourseId()==castOther.getCourseId())
 && ( (this.getCourseCode()==castOther.getCourseCode()) || ( this.getCourseCode()!=null && castOther.getCourseCode()!=null && this.getCourseCode().equals(castOther.getCourseCode()) ) )
 && (this.getListId()==castOther.getListId())
 && (this.getTeacherId()==castOther.getTeacherId());
   }
   
   public int hashCode() {
         int result = 17;
         
         result = 37 * result + this.getCourseId();
         result = 37 * result + ( getCourseCode() == null ? 0 : this.getCourseCode().hashCode() );
         result = 37 * result + this.getListId();
         result = 37 * result + this.getTeacherId();
         return result;
   }   


}


