/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.modern.www._1_3_MySql_DB_daos;

import com.modern.www._1_1_MySql_DB_mainDao.AbstractDao;
import static com.modern.www._1_1_MySql_DB_mainDao.HibernateSessionConMySql.session;
import com.modern.www._1_2_MySql_DB_entities.A0002Tabs;
import com.modern.www._1_2_MySql_DB_entities.A0002TabsId;
import com.modern.www._1_2_MySql_DB_entities.A0003SubTabs;
import java.util.List;
import org.hibernate.query.Query;

/**
 *
 * @author Mahmoud
 */
public class A0003SubTabs_DAO<T> extends AbstractDao<T> {

    public List<A0003SubTabs> GetMenuSubTabsBy(A0002TabsId id) {
        Query query = session.createQuery("SELECT p from A0003SubTabs p WHERE p.id.mainTabId=:mainTabId and p.id.tabId=:tabId");
        query.setInteger("mainTabId", id.getMainTabId());
        query.setInteger("tabId", id.getTabId());
        List<A0003SubTabs> pList = query.getResultList();
        return pList;
    }

    public List<A0003SubTabs> GetMenuSubTabsBy(String mainTabId, String tabId, String subTabId) {
        Query query = session.createQuery("SELECT p from A0003SubTabs p WHERE p.id.mainTabId=:mainTabId and p.id.tabId=:tabId and p.id.subTabId=:subTabId");
        query.setString("mainTabId", mainTabId);
        query.setString("tabId", tabId);
        query.setString("subTabId", subTabId);
        List<A0003SubTabs> pList = query.getResultList();
        return pList;
    }

    public List<A0003SubTabs> GetSubTabsByIndex(String index, String mainTabId, String tabId, String subTabId) {
        Query query = session.createQuery("SELECT p from A0003SubTabs p WHERE p.id.mainTabId=:mainTabId and p.id.tabId=:tabId and p.index1=:index and p.id.subTabId!=:subTabId");
        query.setString("index", index);
        query.setString("mainTabId", mainTabId);
        query.setString("tabId", tabId);
        query.setString("subTabId", subTabId);
        List<A0003SubTabs> pList = query.getResultList();
        return pList;
    }

    public List<A0003SubTabs> GetSubTabsBy(String link) {
        Query query = session.createQuery("SELECT p from A0003SubTabs p WHERE p.link=:link ");
        query.setString("link", link);
        List<A0003SubTabs> pList = query.getResultList();
        return pList;
    }

    public int GetMaxRequireId(String mainTabId, String tabId) {
        Query query = session.createQuery("Select IFNULL(max(p.id.subTabId),0)+1 from A0003SubTabs p where p.id.mainTabId=:mainTabId and p.id.tabId=:tabId");
        query.setString("mainTabId", mainTabId);
        query.setString("tabId", tabId);
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
