/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.modern.www._1_3_MySql_DB_daos;

import com.modern.www._1_1_MySql_DB_mainDao.AbstractDao;
import static com.modern.www._1_1_MySql_DB_mainDao.HibernateSessionConMySql.session;
import com.modern.www._1_2_MySql_DB_entities.A0055StudentsCourses;
import java.util.List;
import org.hibernate.query.Query;

/**
 *
 * @author cdc
 */
public class A0055StudentsCourses_DAO<T> extends AbstractDao<T> {

    public List<A0055StudentsCourses> GetCouresTakenByStudentBy(String stdAcademicEmail) {
        Query query = session.createQuery("SELECT p from A0055StudentsCourses p WHERE p.a0052Students.stdAcademicEmail=:stdAcademicEmail");
        query.setString("stdAcademicEmail", stdAcademicEmail);
        List<A0055StudentsCourses> pList = query.getResultList();
        return pList;
    }

}
