/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.modern.www._5_2_admin_AjaxServlet;

import com.modern.www._1_1_MySql_DB_mainDao.HibernateSessionConMySql;
import com.modern.www._1_2_MySql_DB_entities.A0002Tabs;
import com.modern.www._1_2_MySql_DB_entities.A0003SubTabs;
import com.modern.www._1_2_MySql_DB_entities.A0003SubTabsId;
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
public class _000_general_Ajax_011_add_sub_tabs_AjaxServlet extends HttpServlet {

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
            String mainTabId = request.getParameter("mainTabId");
            String tabId = request.getParameter("tabId");
            String subTabNameA = request.getParameter("subTabNameA");
            String subTabNameE = request.getParameter("subTabNameE");
            String iconFaFa = request.getParameter("iconFaFa");
            String link = request.getParameter("link");

            /**
             * get the main Tab
             */
            List<A0002Tabs> A0002TabsList = new A0002Tabs_DAO<>().GetMenuTabsByID(mainTabId, tabId);
            if (A0002TabsList.isEmpty()) {
                throw new Exception();
            }
            A0002Tabs a0002Tabs = A0002TabsList.get(0);

            int subTabId = new A0003SubTabs_DAO().GetMaxRequireId(mainTabId, tabId);

            A0003SubTabsId id = new A0003SubTabsId(subTabId, Integer.parseInt(tabId), Integer.parseInt(mainTabId));

            //String tabLockedEnch = new Encryption().enchrypt("11");
            A0003SubTabs a0003SubTabs = new A0003SubTabs(id, a0002Tabs, subTabNameA, subTabNameE, 0);

            a0003SubTabs.setIconFaFa(iconFaFa);
            a0003SubTabs.setLink(link);

            HibernateSessionConMySql.MySQL_beginTrans();
            new A0003SubTabs_DAO().insert(a0003SubTabs);
            HibernateSessionConMySql.MySQL_CommitTrans();

            response.getWriter().write("Success");
        } catch (Exception e) {
            HibernateSessionConMySql.MySQL_RollBack();
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
