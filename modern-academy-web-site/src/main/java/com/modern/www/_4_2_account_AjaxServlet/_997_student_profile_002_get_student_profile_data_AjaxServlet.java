/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.modern.www._4_2_account_AjaxServlet;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.modern.www._1_1_MySql_DB_mainDao.HibernateSessionConMySql;
import com.modern.www._1_2_MySql_DB_entities.A0052Students;
import com.modern.www._1_3_MySql_DB_daos.A0052Students_DAO;
import com.modern.www._7_1_jason_entities.a_0_0_5_2_students;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
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
public class _997_student_profile_002_get_student_profile_data_AjaxServlet extends HttpServlet {

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
            // logic Business
            //List<PhotoInsertDataJasonFileClass> articles = new LinkedList<PhotoInsertDataJasonFileClass>();

            BufferedReader br = new BufferedReader(new InputStreamReader(request.getInputStream(), "UTF-8"));

            String json = "";
            if (br != null) {
                json = br.readLine();
                //System.out.println(json);
            }
            // 2. initiate jackson mapper
            ObjectMapper mapper = new ObjectMapper();

            // 3. Convert received JSON to Article
            a_0_0_5_2_students a_0_0_5_2_students = mapper.readValue(json, a_0_0_5_2_students.class);

            String student_academic_email = a_0_0_5_2_students.getStudent_academic_email();
            List<A0052Students> A0052StudentsList = new A0052Students_DAO<>().GetStudentByEmail(student_academic_email);
            if (A0052StudentsList.isEmpty()) {
                throw new Exception();
            }
            A0052Students a0052Students = A0052StudentsList.get(0);

            a_0_0_5_2_students.setStudent_academic_email(a0052Students.getStdAcademicEmail());
            a_0_0_5_2_students.setStudent_personal_email(a0052Students.getStdPersonalEmail());
            a_0_0_5_2_students.setStudent_name_a(a0052Students.getStdNameA());
            a_0_0_5_2_students.setStudent_name_e(a0052Students.getStdNameE());
            a_0_0_5_2_students.setStudent_photo(a0052Students.getStdProfilePhoto());
            a_0_0_5_2_students.setStudent_level(a0052Students.getA0050Levels().getLevelNameA() + " - " + a0052Students.getA0050Levels().getLevelNameE());

            json = mapper.writeValueAsString(a_0_0_5_2_students);
            // success
            response.getWriter().write(json);

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
