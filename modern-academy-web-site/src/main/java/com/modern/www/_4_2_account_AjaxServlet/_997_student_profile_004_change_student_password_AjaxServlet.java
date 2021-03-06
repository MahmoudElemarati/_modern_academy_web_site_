/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.modern.www._4_2_account_AjaxServlet;

import com.modern.www._0_1_ElemaratiLib.Encryption;
import com.modern.www._1_1_MySql_DB_mainDao.HibernateSessionConMySql;
import com.modern.www._1_2_MySql_DB_entities.A0052Students;
import com.modern.www._1_3_MySql_DB_daos.A0052Students_DAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author cdc
 */
public class _997_student_profile_004_change_student_password_AjaxServlet extends HttpServlet {

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
            String teacher_academic_email = request.getParameter("teacher_academic_email");
            String current_password = request.getParameter("current_password");
            String new_password = request.getParameter("new_password");
            String lang = request.getParameter("lang");

            String decripted_password = new Encryption().enchrypt(current_password);
            System.out.println(teacher_academic_email);
            System.out.println(decripted_password);
            List<A0052Students> A0052StudentsList = new A0052Students_DAO<>().GetStudentBy(teacher_academic_email, decripted_password);
            if (A0052StudentsList.isEmpty()) {
                throw new Exception();
            }
            A0052Students a0052Students = A0052StudentsList.get(0);

            String decripted_new_password = new Encryption().enchrypt(new_password);
            a0052Students.setStdPassword(decripted_new_password);

            HibernateSessionConMySql.MySQL_beginTrans();
            new A0052Students_DAO().update(a0052Students);
            HibernateSessionConMySql.MySQL_CommitTrans();
            // success
            response.getWriter().write("Success");

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
