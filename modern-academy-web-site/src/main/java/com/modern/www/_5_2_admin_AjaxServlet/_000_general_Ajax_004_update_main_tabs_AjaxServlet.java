/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.modern.www._5_2_admin_AjaxServlet;

import com.modern.www._1_1_MySql_DB_mainDao.HibernateSessionConMySql;
import com.modern.www._1_2_MySql_DB_entities.A0001MainTabs;
import com.modern.www._1_2_MySql_DB_entities.A0996Departments;
import com.modern.www._1_3_MySql_DB_daos.A0001MainTabs_DAO;
import com.modern.www._1_3_MySql_DB_daos.A0996Departments_DAO;
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
public class _000_general_Ajax_004_update_main_tabs_AjaxServlet extends HttpServlet {

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
            String mainTabNameA = request.getParameter("mainTabNameA");
            String mainTabNameE = request.getParameter("mainTabNameE");
            String iconFaFa = request.getParameter("iconFaFa");
            String link = request.getParameter("link");
            String index = request.getParameter("index");

            

            List<A0001MainTabs> A0001MainTabsList = new A0001MainTabs_DAO<>().GetMainTabsByTabTypeAndIndex(index, tabs_type, mainTabId);
            if (!A0001MainTabsList.isEmpty()) {
                String message = (lang.equals("ar")) ? "هذا الترتيب موجود لقائمة بالفعل" : "This Index Exist In Tab Already";
                throw new Exception(message);
            }

            A0001MainTabsList = new A0001MainTabs_DAO<>().GetMainTabsById(mainTabId);
            if (A0001MainTabsList.isEmpty()) {
                String message = (lang.equals("ar")) ? "حدث خطأ" : "Error";
                throw new Exception(message);
            }
            A0001MainTabs a0001MainTabs = A0001MainTabsList.get(0);

            a0001MainTabs.setMainTabNameA(mainTabNameA);
            a0001MainTabs.setMainTabNameE(mainTabNameE);
            a0001MainTabs.setIconFaFa(iconFaFa);
            a0001MainTabs.setLink(link);
            a0001MainTabs.setIndex1(Integer.parseInt(index));

            
            
            HibernateSessionConMySql.MySQL_beginTrans();
            new A0001MainTabs_DAO().update(a0001MainTabs);
            HibernateSessionConMySql.MySQL_CommitTrans();

            response.getWriter().write("Success");
        } catch (Exception e) {
            HibernateSessionConMySql.MySQL_RollBack();
            e.printStackTrace();
            response.getWriter().write(e.getMessage());
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
