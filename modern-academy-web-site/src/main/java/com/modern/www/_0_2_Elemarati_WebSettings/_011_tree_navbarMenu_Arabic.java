/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.modern.www._0_2_Elemarati_WebSettings;

import com.modern.www._1_2_MySql_DB_entities.A0001MainTabs;
import com.modern.www._1_2_MySql_DB_entities.A0002Tabs;
import com.modern.www._1_2_MySql_DB_entities.A0003SubTabs;
import com.modern.www._1_3_MySql_DB_daos.A0001MainTabs_DAO;
import com.modern.www._1_3_MySql_DB_daos.A0002Tabs_DAO;
import com.modern.www._1_3_MySql_DB_daos.A0003SubTabs_DAO;
import java.util.List;

/**
 *
 * @author Mahmoud
 */
public class _011_tree_navbarMenu_Arabic {

    /**
     * English Menu For Site
     *
     * @param tabs_type
     * @return
     */
    public synchronized String getMainTabs(String tabs_type) {
        String navbar = "";
        /**
         * Get All Main Tabs
         */
        int i = 0;
        List<A0001MainTabs> A0001MainTabsList = new A0001MainTabs_DAO().GetMenuMainTabsForTreeBy(tabs_type);
        navbar += "<li><span class=\"caret\">Tabs</span><ul class=\"nested\">";
        for (A0001MainTabs a0001MainTabs : A0001MainTabsList) {
            String link = (a0001MainTabs.getLink().isEmpty()) ? "" : " | Link : <a href='javascript:;'>" + a0001MainTabs.getLink() + "</a>";
            if (a0001MainTabs.getA0002Tabses().isEmpty()) {
                navbar += "<li>" + a0001MainTabs.getMainTabNameA() + link + "</li>";
            } else {

                navbar += "<li><span class=\"caret\">" + a0001MainTabs.getMainTabNameA() + link + "</span><ul class=\"nested\">";
                /**
                 * Get All Tabs
                 */
                List<A0002Tabs> A0002TabsList = new A0002Tabs_DAO().GetMenuTabsBy("" + a0001MainTabs.getMainTabId());
                for (A0002Tabs a0002Tabs : A0002TabsList) {
                    link = (a0002Tabs.getLink().isEmpty()) ? "" : " | Link : <a href='javascript:;'>" + a0002Tabs.getLink() + "</a>";
                    if (a0002Tabs.getA0003SubTabses().isEmpty()) {
                        navbar += "<li>" + a0002Tabs.getTabNameA() + link + "</li>";
                    } else {

                        navbar += "<li><span class=\"caret\">" + a0002Tabs.getTabNameA()+ link + "</span><ul class=\"nested\">";;

                        /**
                         * Get All Sub Tabs
                         */
                        List<A0003SubTabs> A0003SubTabsList = new A0003SubTabs_DAO().GetMenuSubTabsBy(a0002Tabs.getId());
                        for (A0003SubTabs a0003SubTabs : A0003SubTabsList) {
                            link = (a0003SubTabs.getLink().isEmpty()) ? "" : " | Link : <a href='javascript:;'>" + a0003SubTabs.getLink() + "</a>";
                            navbar += "<li>" + a0003SubTabs.getSubTabNameA() + link + "</li>";
                        }

                        navbar += "</ul></li>";
                    }
                }
                navbar += "</ul></li>";

            }
        }
        navbar += "</ul></li>";
        return navbar;
    }
}
