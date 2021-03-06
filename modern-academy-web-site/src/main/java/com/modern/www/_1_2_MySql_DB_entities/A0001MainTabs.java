package com.modern.www._1_2_MySql_DB_entities;
// Generated Feb 20, 2021 9:15:52 AM by Hibernate Tools 4.3.1


import java.util.HashSet;
import java.util.Set;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

/**
 * A0001MainTabs generated by hbm2java
 */
@Entity
@Table(name="a_0_0_0_1_main_tabs"
    ,catalog="modern_web_site"
)
public class A0001MainTabs  implements java.io.Serializable {


     private int mainTabId;
     private A0000TabsTypes a0000TabsTypes;
     private String mainTabNameA;
     private String mainTabNameE;
     private String iconFaFa;
     private String link;
     private int index1;
     private Set<A0002Tabs> a0002Tabses = new HashSet<A0002Tabs>(0);

    public A0001MainTabs() {
    }

	
    public A0001MainTabs(int mainTabId, A0000TabsTypes a0000TabsTypes, String mainTabNameA, String mainTabNameE, int index1) {
        this.mainTabId = mainTabId;
        this.a0000TabsTypes = a0000TabsTypes;
        this.mainTabNameA = mainTabNameA;
        this.mainTabNameE = mainTabNameE;
        this.index1 = index1;
    }
    public A0001MainTabs(int mainTabId, A0000TabsTypes a0000TabsTypes, String mainTabNameA, String mainTabNameE, String iconFaFa, String link, int index1, Set<A0002Tabs> a0002Tabses) {
       this.mainTabId = mainTabId;
       this.a0000TabsTypes = a0000TabsTypes;
       this.mainTabNameA = mainTabNameA;
       this.mainTabNameE = mainTabNameE;
       this.iconFaFa = iconFaFa;
       this.link = link;
       this.index1 = index1;
       this.a0002Tabses = a0002Tabses;
    }
   
     @Id 

    
    @Column(name="main_tab_id", unique=true, nullable=false)
    public int getMainTabId() {
        return this.mainTabId;
    }
    
    public void setMainTabId(int mainTabId) {
        this.mainTabId = mainTabId;
    }

@ManyToOne(fetch=FetchType.EAGER)
    @JoinColumn(name="tab_type_id", nullable=false)
    public A0000TabsTypes getA0000TabsTypes() {
        return this.a0000TabsTypes;
    }
    
    public void setA0000TabsTypes(A0000TabsTypes a0000TabsTypes) {
        this.a0000TabsTypes = a0000TabsTypes;
    }

    
    @Column(name="main_tab_name_a", nullable=false, length=100)
    public String getMainTabNameA() {
        return this.mainTabNameA;
    }
    
    public void setMainTabNameA(String mainTabNameA) {
        this.mainTabNameA = mainTabNameA;
    }

    
    @Column(name="main_tab_name_e", nullable=false, length=100)
    public String getMainTabNameE() {
        return this.mainTabNameE;
    }
    
    public void setMainTabNameE(String mainTabNameE) {
        this.mainTabNameE = mainTabNameE;
    }

    
    @Column(name="icon_fa_fa", length=100)
    public String getIconFaFa() {
        return this.iconFaFa;
    }
    
    public void setIconFaFa(String iconFaFa) {
        this.iconFaFa = iconFaFa;
    }

    
    @Column(name="link")
    public String getLink() {
        return this.link;
    }
    
    public void setLink(String link) {
        this.link = link;
    }

    
    @Column(name="index_1", nullable=false)
    public int getIndex1() {
        return this.index1;
    }
    
    public void setIndex1(int index1) {
        this.index1 = index1;
    }

@OneToMany(fetch=FetchType.EAGER, mappedBy="a0001MainTabs")
    public Set<A0002Tabs> getA0002Tabses() {
        return this.a0002Tabses;
    }
    
    public void setA0002Tabses(Set<A0002Tabs> a0002Tabses) {
        this.a0002Tabses = a0002Tabses;
    }




}


