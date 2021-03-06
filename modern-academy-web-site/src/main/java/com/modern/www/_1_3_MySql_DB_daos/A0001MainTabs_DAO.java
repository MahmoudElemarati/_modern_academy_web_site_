/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.modern.www._1_3_MySql_DB_daos;

import com.modern.www._1_1_MySql_DB_mainDao.AbstractDao;
import static com.modern.www._1_1_MySql_DB_mainDao.HibernateSessionConMySql.session;
import com.modern.www._1_2_MySql_DB_entities.A0001MainTabs;
import java.util.List;
import org.hibernate.query.Query;

/**
 *
 * @author Mahmoud
 */
public class A0001MainTabs_DAO<T> extends AbstractDao<T> {

    public List<A0001MainTabs> GetMenuMainTabsFor_SideNavBar_By(String tab_type_name) {
        Query query;
        switch (tab_type_name) {
            case "admin":
                query = session.createQuery("SELECT p from A0001MainTabs p WHERE p.a0000TabsTypes.tabNameE IN ( :tabNameE1 , :tabNameE2 , :tabNameE3 , :tabNameE4 ) ORDER BY p.index1 ");
                query.setString("tabNameE1", "account");
                query.setString("tabNameE2", "general");
                query.setString("tabNameE3", "teacher");
                query.setString("tabNameE4", "admin");
                break;
            default:
                /*
                 * case "site"
                 * case "account"
                 * case "general" 
                 * case "teacher" 
                 */
                query = session.createQuery("SELECT p from A0001MainTabs p WHERE p.a0000TabsTypes.tabNameE=:tabNameE ORDER BY p.index1 ");
                query.setString("tabNameE", tab_type_name);

        }
        List<A0001MainTabs> pList = query.getResultList();
        return pList;
    }

    public List<A0001MainTabs> GetMenuMainTabsForTreeBy(String tab_type_name) {
        Query query;
        switch (tab_type_name) {
            case "site":
            case "account":
            case "general":
            case "teacher":
            case "admin":
                query = session.createQuery("SELECT p from A0001MainTabs p WHERE p.a0000TabsTypes.tabNameE=:tabNameE ORDER BY p.index1 ");
                query.setString("tabNameE", tab_type_name);
                break;
            default:
                query = session.createQuery("SELECT p from A0001MainTabs p WHERE p.a0000TabsTypes.tabNameE IN (:tabNameE1 , :tabNameE2 , :tabNameE3, :tabNameE4 ) ORDER BY p.index1 ");
                query.setString("tabNameE1", "admin");
                query.setString("tabNameE2", "account");
                query.setString("tabNameE3", "teacher");
                query.setString("tabNameE4", "site");

        }
        List<A0001MainTabs> pList = query.getResultList();
        return pList;
    }

    public List<A0001MainTabs> GetMainTabsBy(String link) {
        Query query = session.createQuery("SELECT p from A0001MainTabs p WHERE p.link=:link ");
        query.setString("link", link);
        List<A0001MainTabs> pList = query.getResultList();
        return pList;
    }

    public List<A0001MainTabs> GetMainTabsById(String mainTabId) {
        Query query = session.createQuery("SELECT p from A0001MainTabs p WHERE p.mainTabId=:mainTabId ");
        query.setString("mainTabId", mainTabId);
        List<A0001MainTabs> pList = query.getResultList();
        return pList;
    }

    public List<A0001MainTabs> GetMainTabsById(String mainTabId, String tabNameE) {
        Query query = session.createQuery("SELECT p from A0001MainTabs p WHERE p.mainTabId=:mainTabId and p.a0000TabsTypes.tabNameE=:tabNameE");
        query.setString("mainTabId", mainTabId);
        query.setString("tabNameE", tabNameE);
        List<A0001MainTabs> pList = query.getResultList();
        return pList;
    }

    public List<A0001MainTabs> GetMainTabsByTabTypeAndIndex(String index1, String tabNameE, String mainTabId) {
        Query query = session.createQuery("SELECT p from A0001MainTabs p WHERE p.index1=:index1 and p.a0000TabsTypes.tabNameE=:tabNameE and p.mainTabId!=:mainTabId");
        query.setString("index1", index1);
        query.setString("tabNameE", tabNameE);
        query.setString("mainTabId", mainTabId);
        List<A0001MainTabs> pList = query.getResultList();
        return pList;
    }

    public int GetMaxRequireId() {
        Query query = session.createQuery("Select IFNULL(max(p.mainTabId),0)+1 from A0001MainTabs p ");
        int maxRequireSp = GetQueryNumber(query);
        return maxRequireSp;
    }

    private int GetQueryNumber(Query query) {
        List<Integer> list = query.getResultList();
        int number = 0;// no Employee saved in the system
        if (list.get(0) != null) {
            number = list.get(0);
        }
        //System.out.println(number);
        return number;
    }

}
