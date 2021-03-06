package com.modern.www._1_2_MySql_DB_entities;
// Generated Feb 20, 2021 9:15:52 AM by Hibernate Tools 4.3.1


import javax.persistence.Column;
import javax.persistence.Embeddable;

/**
 * A0002TabsId generated by hbm2java
 */
@Embeddable
public class A0002TabsId  implements java.io.Serializable {


     private int tabId;
     private int mainTabId;

    public A0002TabsId() {
    }

    public A0002TabsId(int tabId, int mainTabId) {
       this.tabId = tabId;
       this.mainTabId = mainTabId;
    }
   


    @Column(name="tab_id", nullable=false)
    public int getTabId() {
        return this.tabId;
    }
    
    public void setTabId(int tabId) {
        this.tabId = tabId;
    }


    @Column(name="main_tab_id", nullable=false)
    public int getMainTabId() {
        return this.mainTabId;
    }
    
    public void setMainTabId(int mainTabId) {
        this.mainTabId = mainTabId;
    }


   public boolean equals(Object other) {
         if ( (this == other ) ) return true;
		 if ( (other == null ) ) return false;
		 if ( !(other instanceof A0002TabsId) ) return false;
		 A0002TabsId castOther = ( A0002TabsId ) other; 
         
		 return (this.getTabId()==castOther.getTabId())
 && (this.getMainTabId()==castOther.getMainTabId());
   }
   
   public int hashCode() {
         int result = 17;
         
         result = 37 * result + this.getTabId();
         result = 37 * result + this.getMainTabId();
         return result;
   }   


}


