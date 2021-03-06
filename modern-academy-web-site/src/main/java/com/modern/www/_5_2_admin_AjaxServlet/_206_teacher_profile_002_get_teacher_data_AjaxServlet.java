/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.modern.www._5_2_admin_AjaxServlet;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.modern.www._0_1_ElemaratiLib.Encryption;
import com.modern.www._1_1_MySql_DB_mainDao.HibernateSessionConMySql;
import com.modern.www._1_2_MySql_DB_entities.A0999Teachers;
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
public class _206_teacher_profile_002_get_teacher_data_AjaxServlet extends HttpServlet {

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
            a_0_9_9_9_teachers teacher_Jason = mapper.readValue(json, a_0_9_9_9_teachers.class);
            String teacher_type_id = teacher_Jason.getTeacher_type_id();
            String department_id = teacher_Jason.getDepartment_id();

            List<A0999Teachers> teacherList = new A0999Teachers_DAO().GetTeacherByFilterOf_TeacherType_And_TeacherDepartment(teacher_type_id, department_id);
            /*if (aermList.isEmpty()) {
                throw new Exception();
            }*/

            a_0_9_9_9_teachers[] teachers_Jason_arr = new a_0_9_9_9_teachers[teacherList.size()];

            int i = 0;
            for (A0999Teachers teacher : teacherList) {
                //String ReqStatus[] = new SystemMainCodes().getReqStatusName(Integer.parseInt(aerm.getChkView()));
                a_0_9_9_9_teachers teacher_Jason2 = new a_0_9_9_9_teachers();
                teacher_Jason2.setTeacher_id("" + teacher.getTeacherId());
                teacher_Jason2.setTeacher_name_a(teacher.getTeacherNameA());
                teacher_Jason2.setTeacher_name_e(teacher.getTeacherNameE());
                teacher_Jason2.setTeacher_academic_email(teacher.getTeacherAcademicEmail());
                teacher_Jason2.setTeacher_password(new Encryption().decrypt(teacher.getTeacherPassword()));
                teacher_Jason2.setTeacher_type(teacher.getA0998TeachersTypes().getTeacherTypeNameA() + " - " + teacher.getA0998TeachersTypes().getTeacherTypeNameE());
                teacher_Jason2.setTeacher_type_id("" + teacher.getA0998TeachersTypes().getTeacherTypeId());
                teacher_Jason2.setDepartment_name(teacher.getA0996Departments().getDepartmentNameA() + " - " + teacher.getA0996Departments().getDepartmentNameE());
                teacher_Jason2.setDepartment_id("" + teacher.getA0996Departments().getDepartmentId());

                teacher_Jason2.setTeacher_photo(
                        ("".equals(teacher.getTeacherPhoto()) || teacher.getTeacherPhoto() == null) ? "admin/assets/images/user.png" : "data:image/jpeg;base64," + teacher.getTeacherPhoto()
                );

                teachers_Jason_arr[i] = teacher_Jason2;
                i++;
            }
            json = mapper.writeValueAsString(teachers_Jason_arr);
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
