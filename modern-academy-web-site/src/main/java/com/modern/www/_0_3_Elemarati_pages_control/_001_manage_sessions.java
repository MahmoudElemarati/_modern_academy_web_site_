/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.modern.www._0_3_Elemarati_pages_control;

import com.modern.www._1_2_MySql_DB_entities.A0001MainTabs;
import com.modern.www._1_2_MySql_DB_entities.A0002Tabs;
import com.modern.www._1_2_MySql_DB_entities.A0052Students;
import com.modern.www._1_2_MySql_DB_entities.A0999Teachers;
import com.modern.www._1_2_MySql_DB_entities.A9999AdminUsers;
import com.modern.www._1_3_MySql_DB_daos.A0001MainTabs_DAO;
import com.modern.www._1_3_MySql_DB_daos.A0002Tabs_DAO;
import java.util.List;
import javax.servlet.http.HttpServletRequest;

/**
 *
 * @author Mahmoud
 */
public class _001_manage_sessions {

    public _000_session_needs get_Std_Admin_Session(HttpServletRequest request, String lang) throws Exception {
        String user_id;
        String account_type;
        String user_name;
        String password;
        String photo;
        String current_page_accessServlet;
        String current_page_ar_name;
        String current_page_en_name;
        String user_name_or_academic_email;
        //Find Student
        try {
            A0052Students a0052Students = (A0052Students) request.getSession().getAttribute("a0052Students");
            user_name = (lang.equals("ar")) ? a0052Students.getStdNameA() : a0052Students.getStdNameE();
            password = a0052Students.getStdPassword();
            photo = (a0052Students.getStdProfilePhoto() == null || a0052Students.getStdProfilePhoto().isEmpty()) ? "admin/assets/images/user.png" : "data:image/jpeg;base64," + a0052Students.getStdProfilePhoto();
            account_type = "account";
            user_id = "" + a0052Students.getStdId();
            user_name_or_academic_email = a0052Students.getStdAcademicEmail();
        } catch (Exception Std_ex) {
            //Find Teacher
            try {
                A0999Teachers a0999Teachers = (A0999Teachers) request.getSession().getAttribute("a0999Teachers");
                user_name = (lang.equals("ar")) ? a0999Teachers.getTeacherNameA() : a0999Teachers.getTeacherNameE();
                password = a0999Teachers.getTeacherPassword();
                photo = (a0999Teachers.getTeacherPhoto() == null || a0999Teachers.getTeacherPhoto().isEmpty()) ? "admin/assets/images/user.png" : "data:image/jpeg;base64," + a0999Teachers.getTeacherPhoto();
                account_type = "teacher";
                user_id = "" + a0999Teachers.getTeacherId();
                user_name_or_academic_email = a0999Teachers.getTeacherAcademicEmail();
            } catch (Exception Teacher_ex) {
                //Find admin
                try {
                    A9999AdminUsers a9999AdminUsers = (A9999AdminUsers) request.getSession().getAttribute("a9999AdminUsers");
                    user_name = a9999AdminUsers.getUserName();
                    password = a9999AdminUsers.getUserPassword();
                    photo = "admin/assets/images/user.png";
                    account_type = "admin";
                    user_id = "" + a9999AdminUsers.getUserId();
                    user_name_or_academic_email = a9999AdminUsers.getUserUserName();
                } catch (Exception User_ex) {
                    throw new Exception();
                }
            }

        }

        /**
         * get current AccessServlet
         */
        // -1- Extract accessServlet Name
        current_page_accessServlet = new _002_manage_URL(request).getAccessServlet();
        // -2-get page name from DB
        List<A0001MainTabs> a0001MainTabsList = new A0001MainTabs_DAO<>().GetMainTabsBy(current_page_accessServlet);
        if (a0001MainTabsList.isEmpty()) {
            List<A0002Tabs> a0002TabsList = new A0002Tabs_DAO<>().GetTabsBy(current_page_accessServlet);
            if (a0002TabsList.isEmpty()) {
                current_page_ar_name = "...";
                current_page_en_name = "...";
            } else {
                A0002Tabs a0002Tabs = a0002TabsList.get(0);
                current_page_ar_name = a0002Tabs.getTabNameA();
                current_page_en_name = a0002Tabs.getTabNameE();
            }
        } else {
            A0001MainTabs a0001MainTabs = a0001MainTabsList.get(0);
            current_page_ar_name = a0001MainTabs.getMainTabNameA();
            current_page_en_name = a0001MainTabs.getMainTabNameE();
        }

        _000_session_needs session_needs = new _000_session_needs();
        session_needs.setUser_name(user_name);
        session_needs.setPassword(password);
        session_needs.setPhoto(photo);
        session_needs.setCurrent_page_accessServlet(current_page_accessServlet);
        session_needs.setCurrent_page_ar_name(current_page_ar_name);
        session_needs.setCurrent_page_en_name(current_page_en_name);
        session_needs.setAccount_type(account_type);
        session_needs.setUser_id(user_id);
        session_needs.setUser_name_or_academic_email(user_name_or_academic_email);

        return session_needs;
    }
}
