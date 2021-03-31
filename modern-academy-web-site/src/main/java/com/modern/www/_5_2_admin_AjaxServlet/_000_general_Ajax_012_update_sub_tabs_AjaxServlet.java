/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.modern.www._5_2_admin_AjaxServlet;

import com.modern.www._1_1_MySql_DB_mainDao.HibernateSessionConMySql;
import com.modern.www._1_2_MySql_DB_entities.A0003SubTabs;
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
public class _000_general_Ajax_012_update_sub_tabs_AjaxServlet extends HttpServlet {

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
            String subTabId = request.getParameter("subTabId");
            String subTabNameE = request.getParameter("subTabNameE");
            String subTabNameA = request.getParameter("subTabNameA");
            String iconFaFa = request.getParameter("iconFaFa");
            String link = request.getParameter("link");
            String index = request.getParameter("index");

            List<A0003SubTabs> A0003SubTabsList = new A0003SubTabs_DAO<>().GetSubTabsByIndex(index, mainTabId, tabId, subTabId);
            if (!A0003SubTabsList.isEmpty()) {
                String message = (lang.equals("ar")) ? "هذا الترتيب موجود لقائمة فرعية بالفعل" : "This Index Exist In Sub Tab Already";
                throw new Exception(message);
            }

            A0003SubTabsList = new A0003SubTabs_DAO<>().GetMenuSubTabsBy(mainTabId, tabId, subTabId);
            if (A0003SubTabsList.isEmpty()) {
                String message = (lang.equals("ar")) ? "حدث خطأ" : "Error";
                throw new Exception(message);
            }
            A0003SubTabs a0003SubTabs = A0003SubTabsList.get(0);

            if (a0003SubTabs.getA0002Tabs().getA0996Departments() != null && !link.isEmpty()) {
                String extention_avail = "?Department=" + a0003SubTabs.getA0002Tabs().getA0996Departments().getDepartmentId();
                String extintion_will_be = (link.endsWith(extention_avail)) ? "" : extention_avail;

                link = link + extintion_will_be;
            }
            a0003SubTabs.setSubTabNameA(subTabNameA);
            a0003SubTabs.setSubTabNameE(subTabNameE);
            a0003SubTabs.setIconFaFa(iconFaFa);
            a0003SubTabs.setLink(link);
            a0003SubTabs.setIndex1(Integer.parseInt(index));

            HibernateSessionConMySql.MySQL_beginTrans();
            new A0002Tabs_DAO().update(a0003SubTabs);
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
