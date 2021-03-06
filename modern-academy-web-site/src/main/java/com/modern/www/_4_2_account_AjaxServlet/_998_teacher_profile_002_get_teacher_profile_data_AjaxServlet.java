/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.modern.www._4_2_account_AjaxServlet;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.modern.www._1_1_MySql_DB_mainDao.HibernateSessionConMySql;
import com.modern.www._1_2_MySql_DB_entities.A0994DepartmentsManagers;
import com.modern.www._1_2_MySql_DB_entities.A0995DepartmentsManagmentType;
import com.modern.www._1_2_MySql_DB_entities.A0999Teachers;
import com.modern.www._1_3_MySql_DB_daos.A0994DepartmentsManagers_DAO;
import com.modern.www._1_3_MySql_DB_daos.A0995DepartmentsManagmentType_DAO;
import com.modern.www._1_3_MySql_DB_daos.A0999Teachers_DAO;
import com.modern.www._7_1_jason_entities.a_0_9_9_9_teachers;
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
public class _998_teacher_profile_002_get_teacher_profile_data_AjaxServlet extends HttpServlet {

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
            a_0_9_9_9_teachers a_0_9_9_9_teachers = mapper.readValue(json, a_0_9_9_9_teachers.class);

            String teacher_academic_email = a_0_9_9_9_teachers.getTeacher_academic_email();
            List<A0999Teachers> A0999TeachersList = new A0999Teachers_DAO<>().GetTeacherByEmail(teacher_academic_email);
            if (A0999TeachersList.isEmpty()) {
                throw new Exception();
            }
            A0999Teachers a0999Teachers = A0999TeachersList.get(0);

            a_0_9_9_9_teachers.setTeacher_academic_email(a0999Teachers.getTeacherAcademicEmail());
            a_0_9_9_9_teachers.setTeacher_facebook(a0999Teachers.getTeacherFacebook());
            a_0_9_9_9_teachers.setTeacher_google_plus(a0999Teachers.getTeacherGooglePlus());
            a_0_9_9_9_teachers.setTeacher_linked_in(a0999Teachers.getTeacherLinkedIn());
            a_0_9_9_9_teachers.setTeacher_name_a(a0999Teachers.getTeacherNameA());
            a_0_9_9_9_teachers.setTeacher_name_e(a0999Teachers.getTeacherNameE());
            a_0_9_9_9_teachers.setTeacher_twitter(a0999Teachers.getTeacherTwitter());
            a_0_9_9_9_teachers.setTeacher_photo(a0999Teachers.getTeacherPhoto());
            a_0_9_9_9_teachers.setTeacher_type(a0999Teachers.getA0998TeachersTypes().getTeacherTypeNameA() + " - " + a0999Teachers.getA0998TeachersTypes().getTeacherTypeNameE());

            // Get Position If Exist
            int vice_head_id = a0999Teachers.getA0996Departments().getA0999TeachersByViceHeadId().getTeacherId();
            int head_id = a0999Teachers.getA0996Departments().getA0999TeachersByHeadId().getTeacherId();

            int current_teacher_id = a0999Teachers.getTeacherId();

            if (current_teacher_id == vice_head_id) {
                List<A0995DepartmentsManagmentType> dmtList = new A0995DepartmentsManagmentType_DAO<>().GetDepartmentsManagmentTypeByID("2");// Vice Head
                if (!dmtList.isEmpty()) {
                    A0995DepartmentsManagmentType dmt = dmtList.get(0);
                    String position = "(" + dmt.getManagementNameA() + " (" + a0999Teachers.getA0996Departments().getDepartmentNameA();
                    position += " - " + dmt.getManagementNameE() + " (" + a0999Teachers.getA0996Departments().getDepartmentNameE() + ")";
                    a_0_9_9_9_teachers.setPosition(position);
                }
            }

            if (current_teacher_id == head_id) {
                List<A0995DepartmentsManagmentType> dmtList = new A0995DepartmentsManagmentType_DAO<>().GetDepartmentsManagmentTypeByID("1");// Head
                if (!dmtList.isEmpty()) {
                    A0995DepartmentsManagmentType dmt = dmtList.get(0);
                    String position = "(" + dmt.getManagementNameA() + " (" + a0999Teachers.getA0996Departments().getDepartmentNameA();
                    position += " - " + dmt.getManagementNameE() + " (" + a0999Teachers.getA0996Departments().getDepartmentNameE() + ")";
                    a_0_9_9_9_teachers.setPosition(position);
                }
            }

            json = mapper.writeValueAsString(a_0_9_9_9_teachers);
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
