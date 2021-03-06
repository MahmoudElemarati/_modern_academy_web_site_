/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

var lang_G;
function get_teacher_data(lang) {
    lang_G = lang;
    var teacher_type_id = document.getElementById("teacher_type_id_search").value;
    var department_id = document.getElementById("department_id_search").value;
    var a_0_9_9_9_teachers = new Object();
    a_0_9_9_9_teachers.department_id = department_id;
    a_0_9_9_9_teachers.teacher_type_id = teacher_type_id;

    $.ajax({
        url: "_206_teacher_profile_002_get_teacher_data_AjaxServlet?",
        type: 'POST',
        dataType: 'json',
        data: JSON.stringify(a_0_9_9_9_teachers),
        //contentType: 'application/json',
        // mimeType: 'application/json',
        success: function (a_0_9_9_9_teachers) {
            //a_0_9_9_9_teachers = JSON.parse(data.toString());
            var html = "";
            var i = 0;
            for (; i < a_0_9_9_9_teachers.length; i++) {
                html += "  <tr>"
                        + "     <td>" + a_0_9_9_9_teachers[i].teacher_name_e + "</td>"
                        + "     <td>" + a_0_9_9_9_teachers[i].teacher_name_a + "</td>"
                        + "     <td>" + a_0_9_9_9_teachers[i].teacher_academic_email + "</td>"
                        + "     <td>" + a_0_9_9_9_teachers[i].teacher_password + "</td>"
                        + "     <td>" + a_0_9_9_9_teachers[i].teacher_type + "</td>"
                        + "     <td>" + a_0_9_9_9_teachers[i].department_name + "</td>"
                        + "     <td><img src='" + a_0_9_9_9_teachers[i].teacher_photo + "' width='50%' \></td>"
                        + "  <td>"
                        + "      <button onclick=\"delete_teachers('" + a_0_9_9_9_teachers[i].teacher_id + "','fill-modal','" + lang + "')\" class=\"btn red radius-xl outline\" data-toggle=\"modal\" data-target=\"#teacherDeleteModal\" data-toggle=\"tooltip\" title=\"Delete\"><i class=\"fa fa-trash-o\"></i></button>"
                        + "      <button onclick=\"update_teachers('" + a_0_9_9_9_teachers[i].teacher_id + "','" + a_0_9_9_9_teachers[i].teacher_name_e + "','" + a_0_9_9_9_teachers[i].teacher_name_a + "','" + a_0_9_9_9_teachers[i].teacher_academic_email + "','" + a_0_9_9_9_teachers[i].teacher_password + "','" + a_0_9_9_9_teachers[i].teacher_type_id + "','" + a_0_9_9_9_teachers[i].department_id + "','fill-modal','" + lang + "')\" class=\"btn green radius-xl outline\" data-toggle=\"modal\" data-target=\"#teacherUpdateModal\" data-toggle=\"tooltip\" title=\"Update\"><i class=\"fa fa-edit\"></i></button>"
                        + "  </td>"
                        + "</tr>";
            }
            if (i === 0) {
                if (lang_G === "ar") {
                    html = "<tr><td colspan='8'>لا توجد بيانات</td></tr>";
                } else {
                    html = "<tr><td colspan='8'>No Data</td></tr>";
                }
            }
            document.getElementById("TeachersTable").innerHTML = html;
        },
        error: function (xhr, status) {
            if (lang_G === "ar") {
                Error("حدث خطأ");
            } else {
                Error("Error");
            }
        }
    });
}

var title;
function Success(Body) {
    if (lang_G === "ar") {
        title = "تمت";
    } else {
        title = "Success";
    }
    new PNotify({
        title: title,
        text: Body,
        type: 'success',
        styling: 'bootstrap3'
    });
}
function Error(Body) {
    if (lang_G === "ar") {
        title = "خطأ";
    } else {
        title = "Error";
    }
    new PNotify({
        title: title,
        text: Body,
        type: 'error',
        styling: 'bootstrap3'
    });
}
function Warning(Body) {
    if (lang_G === "ar") {
        title = "تحذير";
    } else {
        title = "Warning";
    }
    new PNotify({
        title: title,
        text: Body,
        styling: 'bootstrap3'
    });
}