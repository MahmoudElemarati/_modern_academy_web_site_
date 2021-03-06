/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.modern.www._1_3_MySql_DB_daos;

import com.modern.www._1_1_MySql_DB_mainDao.AbstractDao;
import static com.modern.www._1_1_MySql_DB_mainDao.HibernateSessionConMySql.session;
import com.modern.www._1_2_MySql_DB_entities.A0998TeachersTypes;
import java.util.List;
import org.hibernate.query.Query;

/**
 *
 * @author cdc
 */
public class A0998TeachersTypes_DAO<T> extends AbstractDao<T> {

    public List<A0998TeachersTypes> GetTeacherTypes() {
        Query query = session.createQuery("SELECT p from A0998TeachersTypes p ");
        List<A0998TeachersTypes> pList = query.getResultList();
        return pList;
    }

}
