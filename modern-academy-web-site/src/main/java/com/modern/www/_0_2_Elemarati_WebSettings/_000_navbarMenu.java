/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.modern.www._0_2_Elemarati_WebSettings;

/**
 *
 * @author Mahmoud
 */
public class _000_navbarMenu {

    public synchronized String getNavBar(String tabs_type, String lang) {
        String navbar = "";
        switch (tabs_type) {
            case "site":
                navbar = (lang.equals("ar"))
                        ? new _002_Site_navbarSiteMenu_Arabic().getMainTabs(tabs_type, lang)
                        : new _001_Site_navbarMenu_English().getMainTabs(tabs_type, lang);
                break;
            case "account":
            case "general":
            case "teacher":
            case "admin":
                navbar = (lang.equals("ar"))
                        ? new _003_admin_navbarMenu_Arabic().getMainTabs(tabs_type, lang)
                        : new _004_admin_navbarMenu_English().getMainTabs(tabs_type, lang);
                break;
            default:
                navbar = "";
        }
        return navbar;
    }

    public synchronized String getUserNavBar(String tabs_type, String lang) {
        String navbar = "";
        switch (tabs_type) {
            case "account":
            case "general":
            case "teacher":
            case "admin":
                navbar = user_navbarMenu(lang);
                break;
            default:
                navbar = "";
        }
        return navbar;
    }

    private String user_navbarMenu(String lang) {
        String navbar = "";
        navbar += "<li><a href=\"_999_siter_logout_controlServlet\">" + ((lang.equals("ar")) ? "تسجيل خروج" : "Log Out") + "</a></li>\n";
        return navbar;
    }

}
