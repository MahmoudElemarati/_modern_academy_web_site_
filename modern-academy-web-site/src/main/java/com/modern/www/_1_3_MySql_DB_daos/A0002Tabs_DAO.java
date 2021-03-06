/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.modern.www._1_3_MySql_DB_daos;

import com.modern.www._1_1_MySql_DB_mainDao.AbstractDao;
import static com.modern.www._1_1_MySql_DB_mainDao.HibernateSessionConMySql.session;
import com.modern.www._1_2_MySql_DB_entities.A0002Tabs;
import java.util.List;
import org.hibernate.query.Query;

/**
 *
 * @author Mahmoud
 */
public class A0002Tabs_DAO<T> extends AbstractDao<T> {

    public List<A0002Tabs> GetMenuTabsBy(String mainTabId) {
        Query query = session.createQuery("SELECT p from A0002Tabs p WHERE p.a0001MainTabs.mainTabId=:mainTabId order by p.index1");
        query.setString("mainTabId", mainTabId);
        List<A0002Tabs> pList = query.getResultList();
        return pList;
    }

    public List<A0002Tabs> GetTabsByIndex(String index, String mainTabId, String tabId) {
        Query query = session.createQuery("SELECT p from A0002Tabs p WHERE p.id.mainTabId=:mainTabId and p.index1=:index and p.id.tabId!=:tabId");
        query.setString("index", index);
        query.setString("mainTabId", mainTabId);
        query.setString("tabId", tabId);
        List<A0002Tabs> pList = query.getResultList();
        return pList;
    }

    public List<A0002Tabs> GetMenuTabsByID(String mainTabId, String tabId) {
        Query query = session.createQuery("SELECT p from A0002Tabs p WHERE p.id.mainTabId=:mainTabId and p.id.tabId=:tabId");
        query.setString("mainTabId", mainTabId);
        query.setString("tabId", tabId);
        List<A0002Tabs> pList = query.getResultList();
        return pList;
    }

    public List<A0002Tabs> GetTabsBy(String link) {
        Query query = session.createQuery("SELECT p from A0002Tabs p WHERE p.link=:link ");
        query.setString("link", link);
        List<A0002Tabs> pList = query.getResultList();
        return pList;
    }

    public int GetMaxRequireId(String mainTabId) {
        Query query = session.createQuery("Select IFNULL(max(p.id.tabId),0)+1 from A0002Tabs p where p.id.mainTabId=:mainTabId ");
        query.setString("mainTabId", mainTabId);
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
