/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.modern.www._1_3_MySql_DB_daos;

import com.modern.www._1_1_MySql_DB_mainDao.AbstractDao;
import static com.modern.www._1_1_MySql_DB_mainDao.HibernateSessionConMySql.session;
import com.modern.www._1_2_MySql_DB_entities.A9999AdminUsers;
import java.util.List;
import org.hibernate.query.Query;

/**
 *
 * @author Mahmoud
 */
public class A9999AdminUsers_DAO<T> extends AbstractDao<T> {

    public List<A9999AdminUsers> GetAdminUserBy(String userUserName, String userPassword) {
        Query query = session.createQuery("SELECT p from A9999AdminUsers p WHERE p.userUserName=:userUserName and p.userPassword=:userPassword");
        query.setString("userUserName", userUserName);
        query.setString("userPassword", userPassword);
        List<A9999AdminUsers> pList = query.getResultList();
        return pList;
    }

}
