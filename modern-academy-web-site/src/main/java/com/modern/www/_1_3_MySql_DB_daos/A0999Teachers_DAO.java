/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.modern.www._1_3_MySql_DB_daos;

import com.modern.www._1_1_MySql_DB_mainDao.AbstractDao;
import static com.modern.www._1_1_MySql_DB_mainDao.HibernateSessionConMySql.session;
import com.modern.www._1_2_MySql_DB_entities.A0996Departments;
import com.modern.www._1_2_MySql_DB_entities.A0999Teachers;
import java.util.ArrayList;
import java.util.List;
import org.hibernate.query.Query;

/**
 *
 * @author cdc
 */
public class A0999Teachers_DAO<T> extends AbstractDao<T> {

    public List<A0999Teachers> GetTeacherByFilterOf_TeacherType_And_TeacherDepartment(String teacherTypeId, String departmentId) {
        List<String> HQL_list = new ArrayList<>();
        if (!teacherTypeId.equals("All")) {
            HQL_list.add("p.a0998TeachersTypes.teacherTypeId=:teacherTypeId");
        }

        if (!departmentId.equals("All")) {
            HQL_list.add("p.a0996Departments.departmentId=:departmentId");
        }
        String HQL = (HQL_list.isEmpty()) ? "" : " WHERE ";
        for (int i = 0; i < HQL_list.size(); i++) {
            String H = HQL_list.get(i);
            if (i == HQL_list.size() - 1) {
                HQL += " " + H + " ";
            } else {
                HQL += " " + H + " and ";
            }
        }
        Query query = session.createQuery("SELECT p from A0999Teachers p " + HQL + " ORDER BY p.a0996Departments.departmentIndex, p.a0998TeachersTypes.teacherTypeId ");

        try {
            query.setString("teacherTypeId", teacherTypeId);
        } catch (Exception teacher_type_id_EX) {

        }
        try {
            query.setString("departmentId", departmentId);
        } catch (Exception teacher_type_id_EX) {

        }

        List<A0999Teachers> pList = query.getResultList();
        return pList;
    }

    public List<A0999Teachers> GetTeacherBy(String teacherAcademicEmail, String teacherPassword) {
        Query query = session.createQuery("SELECT p from A0999Teachers p WHERE p.teacherAcademicEmail=:teacherAcademicEmail and p.teacherPassword=:teacherPassword");
        query.setString("teacherAcademicEmail", teacherAcademicEmail);
        query.setString("teacherPassword", teacherPassword);
        List<A0999Teachers> pList = query.getResultList();
        return pList;
    }

    public List<A0999Teachers> GetTeacherByEmail(String teacherAcademicEmail) {
        Query query = session.createQuery("SELECT p from A0999Teachers p WHERE p.teacherAcademicEmail=:teacherAcademicEmail");
        query.setString("teacherAcademicEmail", teacherAcademicEmail);
        List<A0999Teachers> pList = query.getResultList();
        return pList;
    }

    public List<A0999Teachers> GetTeacherByiD(String teacherId) {
        Query query = session.createQuery("SELECT p from A0999Teachers p WHERE p.teacherId=:teacherId");
        query.setString("teacherId", teacherId);
        List<A0999Teachers> pList = query.getResultList();
        return pList;
    }

    public List<A0999Teachers> GetTeacherByDeptId(String departmentId) {
        Query query = session.createQuery("SELECT p from A0999Teachers p WHERE p.a0996Departments.departmentId=:departmentId");
        query.setString("departmentId", departmentId);
        List<A0999Teachers> pList = query.getResultList();
        return pList;
    }

    public List<A0999Teachers> GetTypedTeachersExceptHeadAndVice(String Head_id, String Vice_id, String teacherTypeId) {
        Query query = session.createQuery("SELECT p from A0999Teachers p WHERE p.a0998TeachersTypes.teacherTypeId=:teacherTypeId AND p.teacherId NOT IN(:teacherId1,:teacherId2)");
        query.setString("teacherTypeId", teacherTypeId);
        query.setString("teacherId1", Head_id);
        query.setString("teacherId2", Vice_id);
        List<A0999Teachers> pList = query.getResultList();
        return pList;
    }

}
