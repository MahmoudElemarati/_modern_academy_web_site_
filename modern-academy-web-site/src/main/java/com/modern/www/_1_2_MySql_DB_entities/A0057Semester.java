package com.modern.www._1_2_MySql_DB_entities;
// Generated Feb 20, 2021 9:15:52 AM by Hibernate Tools 4.3.1


import java.util.HashSet;
import java.util.Set;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

/**
 * A0057Semester generated by hbm2java
 */
@Entity
@Table(name="a_0_0_5_7_semester"
    ,catalog="modern_web_site"
)
public class A0057Semester  implements java.io.Serializable {


     private int semesterId;
     private String semesterNameA;
     private String semesterNameE;
     private Set<A0055StudentsCourses> a0055StudentsCourseses = new HashSet<A0055StudentsCourses>(0);

    public A0057Semester() {
    }

	
    public A0057Semester(int semesterId, String semesterNameA, String semesterNameE) {
        this.semesterId = semesterId;
        this.semesterNameA = semesterNameA;
        this.semesterNameE = semesterNameE;
    }
    public A0057Semester(int semesterId, String semesterNameA, String semesterNameE, Set<A0055StudentsCourses> a0055StudentsCourseses) {
       this.semesterId = semesterId;
       this.semesterNameA = semesterNameA;
       this.semesterNameE = semesterNameE;
       this.a0055StudentsCourseses = a0055StudentsCourseses;
    }
   
     @Id 

    
    @Column(name="semester_id", unique=true, nullable=false)
    public int getSemesterId() {
        return this.semesterId;
    }
    
    public void setSemesterId(int semesterId) {
        this.semesterId = semesterId;
    }

    
    @Column(name="semester_name_a", nullable=false, length=100)
    public String getSemesterNameA() {
        return this.semesterNameA;
    }
    
    public void setSemesterNameA(String semesterNameA) {
        this.semesterNameA = semesterNameA;
    }

    
    @Column(name="semester_name_e", nullable=false, length=100)
    public String getSemesterNameE() {
        return this.semesterNameE;
    }
    
    public void setSemesterNameE(String semesterNameE) {
        this.semesterNameE = semesterNameE;
    }

@OneToMany(fetch=FetchType.EAGER, mappedBy="a0057Semester")
    public Set<A0055StudentsCourses> getA0055StudentsCourseses() {
        return this.a0055StudentsCourseses;
    }
    
    public void setA0055StudentsCourseses(Set<A0055StudentsCourses> a0055StudentsCourseses) {
        this.a0055StudentsCourseses = a0055StudentsCourseses;
    }




}

