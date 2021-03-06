/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.modern.www._1_3_MySql_DB_daos;

import com.modern.www._1_1_MySql_DB_mainDao.AbstractDao;
import static com.modern.www._1_1_MySql_DB_mainDao.HibernateSessionConMySql.session;
import com.modern.www._1_2_MySql_DB_entities.A0996Departments;
import java.util.List;
import org.hibernate.query.Query;

/**
 *
 * @author cdc
 */
public class A0996Departments_DAO<T> extends AbstractDao<T> {

    public List<A0996Departments> GetAllDepartments() {
        Query query = session.createQuery("SELECT p from A0996Departments p ORDER BY p.departmentIndex");
        List<A0996Departments> pList = query.getResultList();
        return pList;
    }

    public List<A0996Departments> GetDepartmentsById(String departmentId) {
        Query query = session.createQuery("SELECT p from A0996Departments p WHERE p.departmentId=:departmentId");
        query.setString("departmentId", departmentId);
        List<A0996Departments> pList = query.getResultList();
        return pList;
    }

}
