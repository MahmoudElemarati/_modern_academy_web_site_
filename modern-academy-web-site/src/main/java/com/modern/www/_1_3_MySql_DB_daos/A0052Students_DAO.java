/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.modern.www._1_3_MySql_DB_daos;

import com.modern.www._1_1_MySql_DB_mainDao.AbstractDao;
import static com.modern.www._1_1_MySql_DB_mainDao.HibernateSessionConMySql.session;
import com.modern.www._1_2_MySql_DB_entities.A0052Students;
import java.util.List;
import org.hibernate.query.Query;

/**
 *
 * @author Mahmoud
 */
public class A0052Students_DAO<T> extends AbstractDao<T> {

    public List<A0052Students> GetStudentBy(String stdAcademicEmail, String stdPassword) {
        Query query = session.createQuery("SELECT p from A0052Students p WHERE p.stdAcademicEmail=:stdAcademicEmail and p.stdPassword=:stdPassword");
        query.setString("stdAcademicEmail", stdAcademicEmail);
        query.setString("stdPassword", stdPassword);
        List<A0052Students> pList = query.getResultList();
        return pList;
    }

    public List<A0052Students> GetStudentByEmail(String stdAcademicEmail) {
        Query query = session.createQuery("SELECT p from A0052Students p WHERE p.stdAcademicEmail=:stdAcademicEmail");
        query.setString("stdAcademicEmail", stdAcademicEmail);
        List<A0052Students> pList = query.getResultList();
        return pList;
    }

}
