/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.modern.www._5_2_admin_AjaxServlet;

import com.modern.www._0_1_ElemaratiLib.Encryption;
import com.modern.www._1_1_MySql_DB_mainDao.HibernateSessionConMySql;
import com.modern.www._1_2_MySql_DB_entities.A0002Tabs;
import com.modern.www._1_2_MySql_DB_entities.A0996Departments;
import com.modern.www._1_3_MySql_DB_daos.A0002Tabs_DAO;
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
public class _000_general_Ajax_008_update_tabs_AjaxServlet extends HttpServlet {

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
            String tabNameA = request.getParameter("tabNameA");
            String tabNameE = request.getParameter("tabNameE");
            String iconFaFa = request.getParameter("iconFaFa");
            String link = request.getParameter("link");
            String index = request.getParameter("index");
            String TabLockedEnch = request.getParameter("TabLockedEnch");
            String _page_name_G_ = request.getParameter("_page_name_G_");
            
            List<A0002Tabs> A0002TabsList = new A0002Tabs_DAO<>().GetTabsByIndex(index, mainTabId, tabId);
            if (!A0002TabsList.isEmpty()) {
                String message = (lang.equals("ar")) ? "هذا الترتيب موجود لقائمة بالفعل" : "This Index Exist In Tab Already";
                throw new Exception(message);
            }

            A0002TabsList = new A0002Tabs_DAO<>().GetMenuTabsByID(mainTabId, tabId);
            if (A0002TabsList.isEmpty()) {
                String message = (lang.equals("ar")) ? "حدث خطأ" : "Error";
                throw new Exception(message);
            }
            A0002Tabs a0002Tabs = A0002TabsList.get(0);

            a0002Tabs.setTabNameA(tabNameA);
            a0002Tabs.setTabNameE(tabNameE);
            a0002Tabs.setIconFaFa(iconFaFa);
            a0002Tabs.setLink(link);
            a0002Tabs.setIndex1(Integer.parseInt(index));

            String tabLockedEnch = new Encryption().enchrypt(TabLockedEnch);
            a0002Tabs.setTabLockedEnch(tabLockedEnch);

            if (_page_name_G_.equals("_202_admin_site_pages")) {
                String department_id = request.getParameter("department_id");
                if (!(department_id.equals("") || department_id == null)) {
                    List<A0996Departments> dList = new A0996Departments_DAO().GetDepartmentsById(department_id);
                    A0996Departments a0996Departments = dList.get(0);
                    a0002Tabs.setA0996Departments(a0996Departments);
                }
            }

            HibernateSessionConMySql.MySQL_beginTrans();
            new A0002Tabs_DAO().update(a0002Tabs);
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
