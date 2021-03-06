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
 * A0995DepartmentsManagmentType generated by hbm2java
 */
@Entity
@Table(name="a_0_9_9_5_departments_managment_type"
    ,catalog="modern_web_site"
)
public class A0995DepartmentsManagmentType  implements java.io.Serializable {


     private int managmentId;
     private String managementNameA;
     private String managementNameE;
     private Set<A0994DepartmentsManagers> a0994DepartmentsManagerses = new HashSet<A0994DepartmentsManagers>(0);

    public A0995DepartmentsManagmentType() {
    }

	
    public A0995DepartmentsManagmentType(int managmentId, String managementNameA, String managementNameE) {
        this.managmentId = managmentId;
        this.managementNameA = managementNameA;
        this.managementNameE = managementNameE;
    }
    public A0995DepartmentsManagmentType(int managmentId, String managementNameA, String managementNameE, Set<A0994DepartmentsManagers> a0994DepartmentsManagerses) {
       this.managmentId = managmentId;
       this.managementNameA = managementNameA;
       this.managementNameE = managementNameE;
       this.a0994DepartmentsManagerses = a0994DepartmentsManagerses;
    }
   
     @Id 

    
    @Column(name="managment_id", unique=true, nullable=false)
    public int getManagmentId() {
        return this.managmentId;
    }
    
    public void setManagmentId(int managmentId) {
        this.managmentId = managmentId;
    }

    
    @Column(name="management_name_a", nullable=false, length=100)
    public String getManagementNameA() {
        return this.managementNameA;
    }
    
    public void setManagementNameA(String managementNameA) {
        this.managementNameA = managementNameA;
    }

    
    @Column(name="management_name_e", nullable=false, length=100)
    public String getManagementNameE() {
        return this.managementNameE;
    }
    
    public void setManagementNameE(String managementNameE) {
        this.managementNameE = managementNameE;
    }

@OneToMany(fetch=FetchType.EAGER, mappedBy="a0995DepartmentsManagmentType")
    public Set<A0994DepartmentsManagers> getA0994DepartmentsManagerses() {
        return this.a0994DepartmentsManagerses;
    }
    
    public void setA0994DepartmentsManagerses(Set<A0994DepartmentsManagers> a0994DepartmentsManagerses) {
        this.a0994DepartmentsManagerses = a0994DepartmentsManagerses;
    }




}

