/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.modern.www._6_1_Login;

import com.modern.www._0_1_ElemaratiLib.DateOp;
import com.modern.www._0_1_ElemaratiLib.Encryption;
import com.modern.www._1_1_MySql_DB_mainDao.HibernateSessionConMySql;
import com.modern.www._1_2_MySql_DB_entities.A0052Students;
import com.modern.www._1_2_MySql_DB_entities.A0999Teachers;
import com.modern.www._1_2_MySql_DB_entities.A9999AdminUsers;
import com.modern.www._1_3_MySql_DB_daos.A0052Students_DAO;
import com.modern.www._1_3_MySql_DB_daos.A0999Teachers_DAO;
import com.modern.www._1_3_MySql_DB_daos.A9999AdminUsers_DAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Mahmoud
 */
public class _001_site_login_AjaxServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        response.setCharacterEncoding("UTF-8");
        request.setCharacterEncoding("UTF-8");
        HibernateSessionConMySql.MySQL_OpenCon();
        try {
            String DemoDate = "2021-06-01";
            String CurrentDate = new DateOp().getCustomSysDate("yyyy-MM-dd");
            long diffDays = new DateOp().differentsBetweenTwoDates(DemoDate, CurrentDate, "yyyy-MM-dd");
            String lang = request.getParameter("lang");
            if (diffDays < 0) {
                String message = (lang.equals("ar")) ? "التراخيص منتهية" : "Licenses Expired";
                throw new Exception(message);
            }
            String username = request.getParameter("username");
            String password = request.getParameter("password");
            String decripted_password = new Encryption().enchrypt(password);
            // Find Student
            List<A0052Students> A0052StudentsList = new A0052Students_DAO<>().GetStudentBy(username, decripted_password);
            if (A0052StudentsList.isEmpty()) {
                // Find Teacher
                List<A0999Teachers> A0999TeachersList = new A0999Teachers_DAO<>().GetTeacherBy(username, decripted_password);
                if (A0999TeachersList.isEmpty()) {
                    // Find Admin
                    List<A9999AdminUsers> A9999AdminUsersList = new A9999AdminUsers_DAO<>().GetAdminUserBy(username, decripted_password);
                    if (A9999AdminUsersList.isEmpty()) {
                        String message = (lang.equals("ar")) ? "الإيميل الأكاديمي أو كلمة المرور خاطئة" : "Invalid Academic Email or Password";
                        throw new Exception(message);
                    } else {
                        response.getWriter().write("Success");
                    }
                } else {
                    response.getWriter().write("Success");
                }

            } else {
                response.getWriter().write("Success");
            }

        } catch (Exception e) {
            e.printStackTrace();
            HibernateSessionConMySql.MySQL_RollBack();
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
