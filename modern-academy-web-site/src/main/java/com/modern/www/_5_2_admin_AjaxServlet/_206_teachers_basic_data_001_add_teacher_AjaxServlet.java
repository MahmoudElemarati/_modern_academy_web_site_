/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.modern.www._5_2_admin_AjaxServlet;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.modern.www._0_1_ElemaratiLib.Encryption;
import com.modern.www._1_1_MySql_DB_mainDao.HibernateSessionConMySql;
import com.modern.www._1_2_MySql_DB_entities.A0996Departments;
import com.modern.www._1_2_MySql_DB_entities.A0998TeachersTypes;
import com.modern.www._1_2_MySql_DB_entities.A0999Teachers;
import com.modern.www._1_3_MySql_DB_daos.A0996Departments_DAO;
import com.modern.www._1_3_MySql_DB_daos.A0998TeachersTypes_DAO;
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
public class _206_teachers_basic_data_001_add_teacher_AjaxServlet extends HttpServlet {

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

            String teacher_photo = a_0_9_9_9_teachers.getTeacher_photo();
            String teacher_name_a = a_0_9_9_9_teachers.getTeacher_name_a();
            String teacher_name_e = a_0_9_9_9_teachers.getTeacher_name_e();
            String teacher_password = a_0_9_9_9_teachers.getTeacher_password();
            String teacher_type_id = a_0_9_9_9_teachers.getTeacher_type_id();
            String teacher_academic_email = a_0_9_9_9_teachers.getTeacher_academic_email();
            String department_id = a_0_9_9_9_teachers.getDepartment_id();
            String lang = a_0_9_9_9_teachers.getLang();

            List<A0996Departments> dList = new A0996Departments_DAO<>().GetDepartmentsById(department_id);
            if (dList.isEmpty()) {
                throw new Exception();
            }
            A0996Departments a0996Departments = dList.get(0);

            //teacher_type_id
            List<A0998TeachersTypes> pList = new A0998TeachersTypes_DAO<>().GetTeacherTypesById(teacher_type_id);
            if (pList.isEmpty()) {
                throw new Exception();
            }
            A0998TeachersTypes a0998TeachersTypes = pList.get(0);

            //teacherId
            int teacherId = new A0999Teachers_DAO<>().GetMaxRequireId();

            A0999Teachers a0999Teachers = new A0999Teachers(teacherId, a0996Departments, a0998TeachersTypes, teacher_name_a, teacher_name_e, teacher_academic_email, new Encryption().enchrypt(teacher_password));
            a0999Teachers.setTeacherPhoto(teacher_photo);
            
            HibernateSessionConMySql.MySQL_beginTrans();
            new A0999Teachers_DAO().insert(a0999Teachers);
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
