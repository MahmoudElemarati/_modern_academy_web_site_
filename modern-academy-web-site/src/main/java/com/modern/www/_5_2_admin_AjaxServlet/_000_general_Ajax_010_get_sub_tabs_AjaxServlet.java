/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.modern.www._5_2_admin_AjaxServlet;

import com.modern.www._1_1_MySql_DB_mainDao.HibernateSessionConMySql;
import com.modern.www._1_2_MySql_DB_entities.A0001MainTabs;
import com.modern.www._1_2_MySql_DB_entities.A0002Tabs;
import com.modern.www._1_2_MySql_DB_entities.A0003SubTabs;
import com.modern.www._1_3_MySql_DB_daos.A0001MainTabs_DAO;
import com.modern.www._1_3_MySql_DB_daos.A0002Tabs_DAO;
import com.modern.www._1_3_MySql_DB_daos.A0003SubTabs_DAO;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author cdc
 */
public class _000_general_Ajax_010_get_sub_tabs_AjaxServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected synchronized void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        response.setCharacterEncoding("UTF-8");
        request.setCharacterEncoding("UTF-8");
        HibernateSessionConMySql.MySQL_OpenCon();
        try {
            String tabs_type = request.getParameter("tabs_type");
            String lang = request.getParameter("lang");
            String combo_or_table = request.getParameter("combo_or_table");
            String HTML = "";
            if (combo_or_table.equals("table")) {
                // Main Tab
                List<A0001MainTabs> A0001MainTabsList = new A0001MainTabs_DAO().GetMenuMainTabsForTreeBy(tabs_type);
                if (A0001MainTabsList.isEmpty()) {
                    HTML = "<tr><td colspan='6'>" + ((lang.equals("ar")) ? "لا يوجد قوائم مسجلة" : "No Tabs Data") + "</td></tr>";
                } else {
                    for (A0001MainTabs a0001MainTabs : A0001MainTabsList) {
                        HTML += "<thead class=\"thead-dark\"><tr><th colspan='6' class='" + a0001MainTabs.getIconFaFa() + "' style='background-color : red;'>"
                                + " " + a0001MainTabs.getMainTabNameE() + " - " + a0001MainTabs.getMainTabNameA() + "\n"
                                + "</th></tr></thead>";
                        // Tabs
                        List<A0002Tabs> A0002TabsList = new A0002Tabs_DAO<>().GetMenuTabsBy("" + a0001MainTabs.getMainTabId());
                        if (A0002TabsList.isEmpty()) {
                            HTML += "<tr><td colspan='6'>" + ((lang.equals("ar")) ? "لا يوجد قوائم مسجلة" : "No Tabs Data") + "</td></tr>";
                        } else {
                            for (A0002Tabs a0002Tabs : A0002TabsList) {
                                HTML += "<thead class=\"thead-dark\" style='background-color : red;'><tr><th colspan='6' class='" + a0002Tabs.getIconFaFa() + "'>"
                                        + " " + a0002Tabs.getTabNameE() + " - " + a0002Tabs.getTabNameA() + "\n"
                                        + "</th></tr></thead>";
                                HTML += "<thead class=\"thead-dark\">\n"
                                        + "     <tr>\n"
                                        + "         <th>\n"
                                        + "             " + ((lang.equals("ar")) ? "إسم القائمة الفرعية باللغة الإنجليزية" : "Sub Tab Name In English") + "\n"
                                        + "         </th>\n"
                                        + "         <th>\n"
                                        + "             " + ((lang.equals("ar")) ? "إسم القائمة الفرعية باللغة العربية" : "Sub Tab Name In Arabic") + "\n"
                                        + "         </th>\n"
                                        + "         <th>\n"
                                        + "             " + ((lang.equals("ar")) ? "الأيقونة" : "Icon") + "\n"
                                        + "         </th>\n"
                                        + "         <th>\n"
                                        + "             " + ((lang.equals("ar")) ? "الرابط" : "Link") + "\n"
                                        + "         </th>\n"
                                        + "         <th>\n"
                                        + "             " + ((lang.equals("ar")) ? "الترتيب" : "order") + "\n"
                                        + "         </th>\n"
                                        + "         <th style=\"width:15%;\"></th>\n"
                                        + "     </tr>\n"
                                        + " </thead>\n"
                                        + " <tbody >\n";
                                // Sub Tabs
                                List<A0003SubTabs> A0003SubTabsList = new A0003SubTabs_DAO<>().GetMenuSubTabsBy(a0002Tabs.getId());
                                if (A0003SubTabsList.isEmpty()) {
                                    HTML += "<tr><td colspan='6'>" + ((lang.equals("ar")) ? "لا يوجد قوائم فرعية مسجلة" : "No Sub Tabs Data") + "</td></tr>";
                                } else {
                                    for (A0003SubTabs a0003SubTabs : A0003SubTabsList) {
                                        HTML += "  <tr>"
                                                + "  <td>" + a0003SubTabs.getSubTabNameE() + "</td>"
                                                + "  <td>" + a0003SubTabs.getSubTabNameA() + "</td>"
                                                + "  <td class='" + a0003SubTabs.getIconFaFa() + "'></td>"
                                                + "  <td>" + a0003SubTabs.getLink() + "</td>"
                                                + "  <td>" + a0003SubTabs.getIndex1() + "</td>"
                                                + "  <td>"
                                                + "      <button onclick=\"delete_sub_Tabs('" + a0003SubTabs.getId().getMainTabId() + "',"
                                                + "                                         '" + a0003SubTabs.getId().getTabId() + "',"
                                                + "                                         '" + a0003SubTabs.getId().getSubTabId() + "',"
                                                + "                                         '" + a0003SubTabs.getA0002Tabs().getA0001MainTabs().getA0000TabsTypes().getTabNameE() + "',"
                                                + "                                         'fill-modal',"
                                                + "                                         '" + lang + "')"
                                                + "     \" class=\"btn red radius-xl outline\" data-toggle=\"modal\" data-target=\"#SubTabsDeleteModal\" data-toggle=\"tooltip\" title=\"Delete\"><i class=\"fa fa-trash-o\"></i></button>"
                                                + "      <button onclick=\"update_sub_tabs('" + a0003SubTabs.getId().getMainTabId() + "',"
                                                + "                                         '" + a0003SubTabs.getId().getTabId() + "',"
                                                + "                                         '" + a0003SubTabs.getId().getSubTabId() + "',"
                                                + "                                         '" + a0003SubTabs.getSubTabNameE() + "',"
                                                + "                                         '" + a0003SubTabs.getSubTabNameA() + "',"
                                                + "                                         '" + a0003SubTabs.getIconFaFa() + "',"
                                                + "                                         '" + a0003SubTabs.getLink() + "',"
                                                + "                                         '" + a0003SubTabs.getIndex1() + "',"
                                                + "                                         '" + a0003SubTabs.getA0002Tabs().getA0001MainTabs().getA0000TabsTypes().getTabNameE() + "',"
                                                + "                                         'fill-modal',"
                                                + "                                         '" + lang + "')"
                                                + "     \" class=\"btn green radius-xl outline\" data-toggle=\"modal\" data-target=\"#SubTabsUpdateModal\" data-toggle=\"tooltip\" title=\"Update\"><i class=\"fa fa-edit\"></i></button>"
                                                + "  </td>"
                                                + "</tr>";
                                    }
                                }
                                HTML += "</tbody>";

                            }
                        }

                    }
                }
            } else {
                String main_tab_id = request.getParameter("main_tab_id");
                List<A0002Tabs> A0002TabsList = new A0002Tabs_DAO<>().GetMenuTabsBy(main_tab_id);
                for (A0002Tabs a0002Tabs : A0002TabsList) {
                    HTML += "<option value='" + a0002Tabs.getId().getTabId() + "'>" + a0002Tabs.getTabNameE() + " - " + a0002Tabs.getTabNameA() + "</option>";

                }
            }
            response.getWriter().write(HTML);
        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().write("Error");
        }

        HibernateSessionConMySql.MySQL_closeConn();
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
