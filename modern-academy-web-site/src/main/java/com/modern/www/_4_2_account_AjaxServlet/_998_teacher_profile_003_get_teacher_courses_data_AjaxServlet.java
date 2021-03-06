/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.modern.www._4_2_account_AjaxServlet;

import com.modern.www._1_1_MySql_DB_mainDao.HibernateSessionConMySql;
import com.modern.www._1_2_MySql_DB_entities.A0997TeachersTeachCourses;
import com.modern.www._1_3_MySql_DB_daos.A0997TeachersTeachCourses_DAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author cdc
 */
public class _998_teacher_profile_003_get_teacher_courses_data_AjaxServlet extends HttpServlet {

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
        List<String> courses_photos = new ArrayList<String>();
        courses_photos.add("assets/images/courses/course-1.png");
        courses_photos.add("assets/images/courses/course-2.png");
        courses_photos.add("assets/images/courses/course-3.png");
        courses_photos.add("assets/images/courses/course-4.png");

        try {
            String teacher_academic_email = request.getParameter("teacher_academic_email");
            String lang = request.getParameter("lang");
            String HTML = "";

            List<A0997TeachersTeachCourses> A0997TeachersTeachCoursesList = new A0997TeachersTeachCourses_DAO<>().GetCouresTeachedByTeacherBy(teacher_academic_email);
            if (A0997TeachersTeachCoursesList.isEmpty()) {
                HTML = "<li class=\"action-card col-xl-4 col-lg-6 col-md-12 col-sm-6 publish\">\n"
                        + "    <div class=\"cours-bx\">\n"
                        + "        <div class=\"info-bx text-center\">\n"
                        + "            <h5>" + ((lang.equals("ar")) ? "لا يوجد كورسات مسجلة" : "No Available Courses") + "</h5>\n"
                        + "        </div>\n"
                        + "    </div>\n"
                        + "</li>";
            } else {
                int i = 0;
                for (A0997TeachersTeachCourses a0997TeachersTeachCourses : A0997TeachersTeachCoursesList) {
                    String panner_photo;
                    if (a0997TeachersTeachCourses.getA0054Courses().getA0053Course().getCoursePanaerPhoto() == null) {
                        if (i == courses_photos.size()) {
                            i = 0;
                        }
                        panner_photo = courses_photos.get(i);
                        i++;
                    } else {
                        panner_photo = a0997TeachersTeachCourses.getA0054Courses().getA0053Course().getCoursePanaerPhoto();
                    }
                    HTML += "<li class=\"action-card col-xl-4 col-lg-6 col-md-12 col-sm-6 publish\">\n"
                            + "    <div class=\"cours-bx\">\n"
                            + "        <div class=\"action-box\">\n"
                            + "            <img src=\"" + panner_photo + "\" alt=\"\">\n"
                            + "            <a href=\"javascript:;\" class=\"btn\">" + a0997TeachersTeachCourses.getA0054Courses().getId().getCourseCode() + "</a>\n"
                            + "        </div>\n"
                            + "        <div class=\"info-bx text-center\">\n"
                            + "            <h5><a href=\"javascript:;\">" + a0997TeachersTeachCourses.getA0054Courses().getA0053Course().getCourseNameE() + "</a></h5>\n"
                            + "            <span>" + a0997TeachersTeachCourses.getA0054Courses().getA0053Course().getCourseNameA() + "</span>\n"
                            + "        </div>\n"
                            + "        <div class=\"cours-more-info\">\n"
                            + "            <div class=\"review\">\n"
                            + "                <span>" + a0997TeachersTeachCourses.getA0054Courses().getA0051Lists().getListNameE() + "</span>\n"
                            + "                <br>\n"
                            + "                <span>" + a0997TeachersTeachCourses.getA0054Courses().getA0051Lists().getListNameA() + "</span>\n"
                            + "            </div>\n"
                            + "            <div class=\"price\">\n"
                            + "                <h5>" + a0997TeachersTeachCourses.getA0054Courses().getId().getCourseCode() + "</h5>\n"
                            + "            </div>\n"
                            + "        </div>\n"
                            + "    </div>\n"
                            + "</li>";
                }
            }
            response.getWriter().write(HTML);
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
