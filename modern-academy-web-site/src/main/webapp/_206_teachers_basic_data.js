/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
//

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

                var photo;
                var photo_base64;
                if (a_0_9_9_9_teachers[i].teacher_photo === null || a_0_9_9_9_teachers[i].teacher_photo === "") {
                    photo = "admin/assets/images/user.png";
                    photo_base64 = "";
                } else {
                    photo = "data:image/jpeg;base64," + a_0_9_9_9_teachers[i].teacher_photo;
                    photo_base64 = a_0_9_9_9_teachers[i].teacher_photo;
                }
                document.getElementById("profile-image-2").src = photo;
                document.getElementById("profile-image-2-val").value = photo_base64;
                html += "  <tr>"
                        + "     <td>" + a_0_9_9_9_teachers[i].teacher_name_e + "</td>"
                        + "     <td>" + a_0_9_9_9_teachers[i].teacher_name_a + "</td>"
                        + "     <td>" + a_0_9_9_9_teachers[i].teacher_academic_email + "</td>"
                        + "     <td>" + a_0_9_9_9_teachers[i].teacher_password + "</td>"
                        + "     <td>" + a_0_9_9_9_teachers[i].teacher_type + "</td>"
                        + "     <td>" + a_0_9_9_9_teachers[i].department_name + "</td>"
                        + "     <td><img src='" + photo + "' width='50%' \></td>"
                        + "  <td>"
                        + "      <button onclick=\"delete_teachers('" + a_0_9_9_9_teachers[i].teacher_id + "','fill-modal','" + lang + "')\" class=\"btn red radius-xl outline\" data-toggle=\"modal\" data-target=\"#teacherDeleteModal\" data-toggle=\"tooltip\" title=\"Delete\"><i class=\"fa fa-trash-o\"></i></button>"
                        + "      <button onclick=\"update_teachers('" + photo_base64 + "','" + a_0_9_9_9_teachers[i].teacher_id + "','" + a_0_9_9_9_teachers[i].teacher_name_e + "','" + a_0_9_9_9_teachers[i].teacher_name_a + "','" + a_0_9_9_9_teachers[i].teacher_academic_email + "','" + a_0_9_9_9_teachers[i].teacher_password + "','" + a_0_9_9_9_teachers[i].teacher_type_id + "','" + a_0_9_9_9_teachers[i].department_id + "','fill-modal','" + lang + "')\" class=\"btn green radius-xl outline\" data-toggle=\"modal\" data-target=\"#teacherUpdateModal\" data-toggle=\"tooltip\" title=\"Update\"><i class=\"fa fa-edit\"></i></button>"
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
var teacher_id_G;
function update_teachers(Teacher_photo, teacher_id, Teacher_name_e, Teacher_name_a, Teacher_academic_email, Teacher_password, Teacher_type_id, Department_id, type, lang) {
    if (type === 'fill-modal') {
        //filling modal in html
        teacher_id_G = teacher_id;
        document.getElementById("teacher_name_e_update").value = Teacher_name_e;
        document.getElementById("teacher_name_a_update").value = Teacher_name_a;

        document.getElementById("teacher_academic_email_update").value = Teacher_academic_email;
        document.getElementById("teacher_password_update").value = Teacher_password;

        document.getElementById("teacher_type_id_update").value = Teacher_type_id;
        document.getElementById("department_id_update").value = Department_id;

        var photo;
        var photo_base64;
        if (Teacher_photo === null || Teacher_photo === "") {
            photo = "admin/assets/images/user.png";
            photo_base64 = "";
        } else {
            photo = "data:image/jpeg;base64," + Teacher_photo;
            photo_base64 = Teacher_photo;
        }
        document.getElementById("profile-image-2").src = photo;
        document.getElementById("profile-image-2-val").value = photo_base64;


    } else {
        //update Database
        var teacher_name_e = document.getElementById("teacher_name_e_update").value;
        var teacher_name_a = document.getElementById("teacher_name_a_update").value;
        var teacher_academic_email = document.getElementById("teacher_academic_email_update").value;
        var teacher_password = document.getElementById("teacher_password_update").value;
        var teacher_type_id = document.getElementById("teacher_type_id_update").value;
        var department_id = document.getElementById("department_id_update").value;
        var teacher_photo = document.getElementById("profile-image-2-val").value;
        if (teacher_name_e === '' || teacher_name_e === null) {
            if (lang === "ar") {
                Warning("برجاء ملئ خانة الإسم باللغة الإنجليزية");
            } else {
                Warning("Please Fill Name In English");
            }
        } else if (teacher_name_a === '' || teacher_name_a === null) {
            if (lang === "ar") {
                Warning("برجاء ملئ خانة الإسم باللغة العربية");
            } else {
                Warning("Please Fill Name In Arabic");
            }
        } else if (teacher_academic_email === '' || teacher_academic_email === null) {
            if (lang === "ar") {
                Warning("برجاء ملئ خانة الإيميل الأكاديمي");
            } else {
                Warning("Please Fill Academic Email");
            }
        } else if (teacher_password === '' || teacher_password === null) {
            if (lang === "ar") {
                Warning("برجاء ملئ خانة كلمة المرور");
            } else {
                Warning("Please Fill Password");
            }
        } else if (teacher_password.length < password_length) {
            if (lang === "ar") {
                Warning("كلمة المرور لا تقل عن " + password_length + " حروف");
            } else {
                Warning("Password Cant Be Less Than " + password_length + " Characters");
            }
        } else if (teacher_type_id === '' || teacher_type_id === null) {
            if (lang === "ar") {
                Warning("برجاء اختر خانة الدرجة العلمية");
            } else {
                Warning("Please Choose Degree");
            }
        } else if (department_id === '' || department_id === null) {
            if (lang === "ar") {
                Warning("برجاء اختر خانة القسم");
            } else {
                Warning("Please Choose Department");
            }
        } else {
            var a_0_9_9_9_teachers = new Object();
            a_0_9_9_9_teachers.teacher_id = teacher_id_G;
            a_0_9_9_9_teachers.teacher_photo = teacher_photo;
            a_0_9_9_9_teachers.teacher_name_a = teacher_name_a;
            a_0_9_9_9_teachers.teacher_name_e = teacher_name_e;
            a_0_9_9_9_teachers.teacher_password = teacher_password;
            a_0_9_9_9_teachers.teacher_type_id = teacher_type_id;
            a_0_9_9_9_teachers.teacher_academic_email = teacher_academic_email;
            a_0_9_9_9_teachers.department_id = department_id;
            a_0_9_9_9_teachers.lang = lang;
            $.ajax({
                url: "_206_teachers_basic_data_002_update_teachers_AjaxServlet?",
                type: 'POST',
                //dataType: 'json',
                data: JSON.stringify(a_0_9_9_9_teachers),
                //contentType: 'application/json',
                // mimeType: 'application/json',
                success: function (data) {
                    if (data === "Success") {
                        if (lang_G === "ar") {
                            Success("تم حفظ البيانات");
                        } else {
                            Success("Data Saved");
                        }
                        document.getElementById('department_id_search').value = department_id;
                        document.getElementById('teacher_type_id_search').value = "All";
                        get_teacher_data(lang);
                        $('#teacherUpdateModal').modal('hide');
                        init_field();
                    } else {
                        Error("Error");
                    }
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
    }
}

function add_teacher(lang) {
    lang_G = lang;
    var teacher_name_e = document.getElementById('teacher_name_e').value;
    var teacher_name_a = document.getElementById('teacher_name_a').value;
    var teacher_academic_email = document.getElementById('teacher_academic_email').value;
    var teacher_password = document.getElementById('teacher_password').value;
    var teacher_type_id = document.getElementById('teacher_type_id').value;
    var department_id = document.getElementById('department_id').value;
    var teacher_photo = document.getElementById('profile-image-1-val').value;
    if (teacher_name_e === '' || teacher_name_e === null) {
        if (lang === "ar") {
            Warning("برجاء ملئ خانة الإسم باللغة الإنجليزية");
        } else {
            Warning("Please Fill Name In English");
        }
    } else if (teacher_name_a === '' || teacher_name_a === null) {
        if (lang === "ar") {
            Warning("برجاء ملئ خانة الإسم باللغة العربية");
        } else {
            Warning("Please Fill Name In Arabic");
        }
    } else if (teacher_academic_email === '' || teacher_academic_email === null) {
        if (lang === "ar") {
            Warning("برجاء ملئ خانة الإيميل الأكاديمي");
        } else {
            Warning("Please Fill Academic Email");
        }
    } else if (teacher_password === '' || teacher_password === null) {
        if (lang === "ar") {
            Warning("برجاء ملئ خانة كلمة المرور");
        } else {
            Warning("Please Fill Password");
        }
    } else if (teacher_password.length < password_length) {
        if (lang === "ar") {
            Warning("كلمة المرور لا تقل عن " + password_length + " حروف");
        } else {
            Warning("Password Cant Be Less Than " + password_length + " Characters");
        }
    } else if (teacher_type_id === '' || teacher_type_id === null) {
        if (lang === "ar") {
            Warning("برجاء اختر خانة الدرجة العلمية");
        } else {
            Warning("Please Choose Degree");
        }
    } else if (department_id === '' || department_id === null) {
        if (lang === "ar") {
            Warning("برجاء اختر خانة القسم");
        } else {
            Warning("Please Choose Department");
        }
    } else {
        var a_0_9_9_9_teachers = new Object();
        a_0_9_9_9_teachers.teacher_photo = teacher_photo;
        a_0_9_9_9_teachers.teacher_name_a = teacher_name_a;
        a_0_9_9_9_teachers.teacher_name_e = teacher_name_e;
        a_0_9_9_9_teachers.teacher_password = teacher_password;
        a_0_9_9_9_teachers.teacher_type_id = teacher_type_id;
        a_0_9_9_9_teachers.teacher_academic_email = teacher_academic_email;
        a_0_9_9_9_teachers.department_id = department_id;
        a_0_9_9_9_teachers.lang = lang_G;
        $.ajax({
            url: "_206_teachers_basic_data_001_add_teacher_AjaxServlet?",
            type: 'POST',
            //dataType: 'json',
            data: JSON.stringify(a_0_9_9_9_teachers),
            //contentType: 'application/json',
            // mimeType: 'application/json',
            success: function (data) {
                if (data === "Success") {
                    if (lang_G === "ar") {
                        Success("تم حفظ البيانات");
                    } else {
                        Success("Data Saved");
                    }
                    document.getElementById('department_id_search').value = department_id;
                    document.getElementById('teacher_type_id_search').value = "All";
                    get_teacher_data(lang);
                    init_field();
                } else {
                    Error("Error");
                }
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


}
function delete_teachers(teacher_id, type, lang) {
    if (type === 'fill-modal') {
        //filling modal in html
        teacher_id_G = teacher_id;
    } else {
        //delete from Database

        var URL = "_206_teachers_basic_data_003_delete_teachers_AjaxServlet?"
                + "teacher_id=" + teacher_id_G
                + "&lang=" + lang;
        var xhttp = new XMLHttpRequest();
        xhttp.open("POST", URL, true);
        xhttp.send();
        xhttp.onreadystatechange = function () {
            if (xhttp.readyState === 4 && xhttp.status === 200) {
                var message = xhttp.responseText;
                if (message === "Success") {
                    if (lang === "ar") {
                        Success("تم حذف البيانات");
                    } else {
                        Success("Data Deleted");
                    }
                    get_teacher_data(lang);
                    init_field();
                    $('#teacherDeleteModal').modal('hide');
                } else {
                    if (lang === "ar") {
                        Error("لا يمكن حذف هذا البيان لارتباطه ببيانات أخرى");
                    } else {
                        Error("can't delete this data because it is connected to other data");
                    }
                }
            }
        };
    }

}
function init_field() {
    document.getElementById('teacher_name_e').value = "";
    document.getElementById('teacher_name_a').value = "";
    document.getElementById('teacher_academic_email').value = "";
    document.getElementById('teacher_password').value = "";
    document.getElementById('teacher_type_id').value = "";
    document.getElementById('department_id').value = "";
    document.getElementById('profile-image-1').src = "admin/assets/images/user.png";
    document.getElementById('profile-image-1-val').value = "";

    teacher_id_G = "";
    document.getElementById("teacher_name_e_update").value = "";
    document.getElementById("teacher_name_a_update").value = "";

    document.getElementById("teacher_academic_email_update").value = "";
    document.getElementById("teacher_password_update").value = "";

    document.getElementById("teacher_type_id_update").value = "";
    document.getElementById("department_id_update").value = "";
}

////////////////////////////////////////////////////////////////
//Image 1
function showImage()
{
    if (this.files && this.files[0])
    {
        var obj = new FileReader();
        obj.onload = function (data) {
            var image = document.getElementById("profile-image-1");
            image.src = data.target.result;
            image.style.display = "block";
        };
        obj.readAsDataURL(this.files[0]);
    }
}

var handleFileSelect = function (evt) {
    var files = evt.target.files;
    var file = files[0];

    if (files && file) {
        var reader = new FileReader();

        reader.onload = function (readerEvt) {
            var binaryString = readerEvt.target.result;
            document.getElementById("profile-image-1-val").value = btoa(binaryString);
        };

        reader.readAsBinaryString(file);
    }
};
////////////////////////////////////////////////////////////////
//Image 2
function showImage()
{
    if (this.files && this.files[0])
    {
        var obj = new FileReader();
        obj.onload = function (data) {
            var image = document.getElementById("profile-image-2");
            image.src = data.target.result;
            image.style.display = "block";
        };
        obj.readAsDataURL(this.files[0]);
    }
}

var handleFileSelect = function (evt) {
    var files = evt.target.files;
    var file = files[0];

    if (files && file) {
        var reader = new FileReader();

        reader.onload = function (readerEvt) {
            var binaryString = readerEvt.target.result;
            document.getElementById("profile-image-2-val").value = btoa(binaryString);
        };

        reader.readAsBinaryString(file);
    }
};
////////////////////////////////////////////////

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