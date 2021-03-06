/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.modern.www._0_2_Elemarati_WebSettings;

import com.modern.www._1_2_MySql_DB_entities.A0001MainTabs;
import com.modern.www._1_2_MySql_DB_entities.A0002Tabs;
import com.modern.www._1_3_MySql_DB_daos.A0001MainTabs_DAO;
import com.modern.www._1_3_MySql_DB_daos.A0002Tabs_DAO;
import java.util.List;

/**
 *
 * @author Mahmoud
 */
public class _004_admin_navbarMenu_English {

    /**
     * English Menu For Site
     *
     * @param tabs_type
     * @return
     */
    public synchronized String getMainTabs(String tabs_type, String lang) {
        String navbar = "";

        /**
         * Get All Main Tabs
         */
        List<A0001MainTabs> A0001MainTabsList = new A0001MainTabs_DAO<>().GetMenuMainTabsFor_SideNavBar_By(tabs_type);
        for (A0001MainTabs a0001MainTabs : A0001MainTabsList) {
            String a0001MainTab_link = (a0001MainTabs.getLink().isEmpty()) ? "javascript:;" : a0001MainTabs.getLink() + "?lang=" + lang;
            String arrow = (a0001MainTabs.getA0002Tabses().isEmpty()) ? "" : "<span class=\"ttr-arrow-icon\"><i class=\"fa fa-angle-down\"></i></span>";
            navbar += "<li>\n"
                    + "    <a href=\"" + a0001MainTab_link + "\" class=\"ttr-material-button\">\n"
                    + "        <span class=\"ttr-icon\"><i class=\"" + a0001MainTabs.getIconFaFa() + "\"></i></span>\n"
                    + "        <span class=\"ttr-label\">" + a0001MainTabs.getMainTabNameE() + "</span>\n";
            navbar += arrow;
            navbar += "    </a>\n";
            navbar += getTabs(a0001MainTabs, lang);
            navbar += "</li>";
        }
        return navbar;
    }

    /**
     * Get All Tabs
     */
    private synchronized String getTabs(A0001MainTabs a0001MainTabs, String lang) {
        String navbar = "";
        /**
         * Get All Tabs
         */
        List<A0002Tabs> A0002TabsList = new A0002Tabs_DAO<>().GetMenuTabsBy("" + a0001MainTabs.getMainTabId());
        navbar += (A0002TabsList.isEmpty()) ? "" : "<ul>\n";
        for (A0002Tabs a0002Tabs : A0002TabsList) {
            String a0002Tabs_link = (a0002Tabs.getLink().isEmpty()) ? "javascript:;" : a0002Tabs.getLink() + "?lang=" + lang;
            navbar += "    <li>\n"
                    + "        <a href=\"" + a0002Tabs_link + "\" class=\"ttr-material-button\"><span class=\"ttr-label\">" + a0002Tabs.getTabNameE() + "</span></a>\n"
                    + "    </li>\n";
        }
        navbar += (A0002TabsList.isEmpty()) ? "" : "</ul>";
        return navbar;
    }

}
