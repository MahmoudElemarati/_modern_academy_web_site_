/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.modern.www._5_2_admin_AjaxServlet;

import com.modern.www._1_1_MySql_DB_mainDao.HibernateSessionConMySql;
import com.modern.www._1_2_MySql_DB_entities.A0001MainTabs;
import com.modern.www._1_3_MySql_DB_daos.A0001MainTabs_DAO;
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
public class _000_general_Ajax_002_get_main_tabs_AjaxServlet extends HttpServlet {

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

            List<A0001MainTabs> A0001MainTabsList = new A0001MainTabs_DAO().GetMenuMainTabsForTreeBy(tabs_type);
            if (A0001MainTabsList.isEmpty()) {
                HTML = "<tr><td colspan='6'>" + ((lang.equals("ar")) ? "لا يوجد قوائم مسجلة" : "No Tabs Data") + "</td></tr>";
            } else {
                for (A0001MainTabs a0001MainTabs : A0001MainTabsList) {
                    if (combo_or_table.equals("table")) {                        
                        HTML += "  <tr>"
                                + "  <td>" + a0001MainTabs.getMainTabNameE() + "</td>"
                                + "  <td>" + a0001MainTabs.getMainTabNameA() + "</td>"
                                + "  <td class='" + a0001MainTabs.getIconFaFa() + "'></td>"
                                + "  <td>" + a0001MainTabs.getLink() + "</td>"
                                + "  <td>" + a0001MainTabs.getIndex1() + "</td>"
                                + "  <td>"
                                + "      <button onclick=\"delete_main_Tabs('" + a0001MainTabs.getMainTabId() + "','" + a0001MainTabs.getA0000TabsTypes().getTabNameE() + "','fill-modal','" + lang + "')\" class=\"btn red radius-xl outline\" data-toggle=\"modal\" data-target=\"#mainTabsDeleteModal\" data-toggle=\"tooltip\" title=\"Delete\"><i class=\"fa fa-trash-o\"></i></button>"
                                + "      <button onclick=\"update_main_tabs('" + a0001MainTabs.getMainTabId() + "','" + a0001MainTabs.getMainTabNameE() + "','" + a0001MainTabs.getMainTabNameA() + "','" + a0001MainTabs.getIconFaFa() + "','" + a0001MainTabs.getLink() + "','" + a0001MainTabs.getIndex1() + "','" + a0001MainTabs.getA0000TabsTypes().getTabNameE() + "','fill-modal','" + lang + "')\" class=\"btn green radius-xl outline\" data-toggle=\"modal\" data-target=\"#mainTabsUpdateModal\" data-toggle=\"tooltip\" title=\"Update\"><i class=\"fa fa-edit\"></i></button>"
                                + "  </td>"
                                + "</tr>";
                    } else {
                        HTML += "<option value='" + a0001MainTabs.getMainTabId() + "'>" + a0001MainTabs.getMainTabNameE() + " - " + a0001MainTabs.getMainTabNameA() + "</option>";
                    }
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
