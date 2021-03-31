package com.modern.www._1_2_MySql_DB_entities;
// Generated Mar 29, 2021 8:57:57 PM by Hibernate Tools 4.3.1


import javax.persistence.Column;
import javax.persistence.Embeddable;

/**
 * A0056ComplaintsId generated by hbm2java
 */
@Embeddable
public class A0056ComplaintsId  implements java.io.Serializable {


     private int complaintId;
     private int stdId;

    public A0056ComplaintsId() {
    }

    public A0056ComplaintsId(int complaintId, int stdId) {
       this.complaintId = complaintId;
       this.stdId = stdId;
    }
   


    @Column(name="complaint_id", nullable=false)
    public int getComplaintId() {
        return this.complaintId;
    }
    
    public void setComplaintId(int complaintId) {
        this.complaintId = complaintId;
    }


    @Column(name="std_id", nullable=false)
    public int getStdId() {
        return this.stdId;
    }
    
    public void setStdId(int stdId) {
        this.stdId = stdId;
    }


   public boolean equals(Object other) {
         if ( (this == other ) ) return true;
		 if ( (other == null ) ) return false;
		 if ( !(other instanceof A0056ComplaintsId) ) return false;
		 A0056ComplaintsId castOther = ( A0056ComplaintsId ) other; 
         
		 return (this.getComplaintId()==castOther.getComplaintId())
 && (this.getStdId()==castOther.getStdId());
   }
   
   public int hashCode() {
         int result = 17;
         
         result = 37 * result + this.getComplaintId();
         result = 37 * result + this.getStdId();
         return result;
   }   


}


