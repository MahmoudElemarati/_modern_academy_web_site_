/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
function sleep(ms) {
    return new Promise(resolve => setTimeout(resolve, ms));
}

var lang_G;
var general_student_academic_email;
function getStudentId(lang) {
    lang_G = lang;
    var again = true;
    var allow = true;
    var checked = false;
    while (again) {
        var messagePrompet;
        if (lang === "ar") {
            messagePrompet = "إيميل عضو هيئة التعليم";
        } else {
            messagePrompet = "Student Staff Academic Email";
        }
        var student_academic_email = prompt(messagePrompet);
        if (student_academic_email === "" || student_academic_email === null) {
            if (lang === "ar") {
                alert("برجاء كتابة الإيميل");
            } else {
                alert("Please Write Academic Email");
            }
            if (confirm("Do You Want To Continue?")) {
                continue;
            } else {
                allow = false;
                break;
            }
            checked = false;
        } else {
            checked = true;
        }

        if (checked) {
            again = false;
            var URL = "_997_student_profile_000_get_student_by_id_AjaxServlet?"
                    + "lang=" + lang
                    + "&student_academic_email=" + student_academic_email;
            var xhttp = new XMLHttpRequest();
            xhttp.open("POST", URL, true);
            xhttp.send();
            xhttp.onreadystatechange = function () {
                if (xhttp.readyState === 4 && xhttp.status === 200) {
                    var message = xhttp.responseText;
                    if (message === "Error") {
                        if (lang === "ar") {
                            alert("لا يوجد عضو بهذا الإيميل");
                        } else {
                            alert("No Staff With This email");
                        }
                        if (confirm("-- Do You Want To Continue?")) {
                            getStudentId(lang);
                        } else {
                            allow = false;
                            document.location.href = "_100_account_index_AccessServlet?lang=" + lang;
                        }
                    } else {
                        general_student_academic_email = message;
                        fill_page_content();
                    }
                }
            };
        }
    }
    if (allow === false) {
        document.location.href = "_100_account_index_AccessServlet?lang=" + lang;
    }
}

function setStudentId(lang, student_academic_email) {
    lang_G = lang;
    general_student_academic_email = student_academic_email;
    fill_page_content();
}

async function fill_page_content() {
    await sleep(200);
    get_student_profile_data(general_student_academic_email);
    await sleep(400);
    get_student_courses_data(general_student_academic_email);
}

function get_student_courses_data(student_academic_email) {

    var URL = "_997_student_profile_003_get_student_courses_data_AjaxServlet?"
            + "student_academic_email=" + student_academic_email
            + "&lang=" + lang_G;
    var xhttp = new XMLHttpRequest();
    xhttp.open("POST", URL, true);
    xhttp.send();
    xhttp.onreadystatechange = function () {
        if (xhttp.readyState === 4 && xhttp.status === 200) {
            var message = xhttp.responseText;
            if (message === "Error") {
                if (lang_G === "ar") {
                    Error("حدث خطا");
                } else {
                    Error("Error");
                }
            } else {
                document.getElementById("masonry").innerHTML = message;
            }
        }
    };

}

function get_student_profile_data(student_academic_email) {
    var a_0_0_5_2_students = new Object();
    a_0_0_5_2_students.student_photo = "";
    a_0_0_5_2_students.student_name_a = "";
    a_0_0_5_2_students.student_name_e = "";
    a_0_0_5_2_students.student_personal_email = "";
    a_0_0_5_2_students.student_academic_email = student_academic_email;
    a_0_0_5_2_students.student_level = "";
    $.ajax({
        url: "_997_student_profile_002_get_student_profile_data_AjaxServlet?",
        type: 'POST',
        dataType: 'json',
        data: JSON.stringify(a_0_0_5_2_students),
        //contentType: 'application/json',
        // mimeType: 'application/json',
        success: function (a_0_0_5_2_students) {
            //a_0_0_5_2_students = JSON.parse(data.toString());

            /// Photos
            var photo;
            var photo_base64;
            if (a_0_0_5_2_students.student_photo === null || a_0_0_5_2_students.student_photo === "") {
                photo = "admin/assets/images/user.png";
                photo_base64 = "";
            } else {
                photo = "data:image/jpeg;base64," + a_0_0_5_2_students.student_photo;
                photo_base64 = a_0_0_5_2_students.student_photo;
            }
            document.getElementById("profile-image-1").src = photo;
            document.getElementById("profile-image-2").src = photo;
            document.getElementById("profile-image-2-val").value = photo_base64;

            /// Names
            document.getElementById("student_name_a").value = a_0_0_5_2_students.student_name_a;
            document.getElementById("student_name_e").value = a_0_0_5_2_students.student_name_e;
            if (lang_G === "ar") {
                document.getElementById("profile_user_name").innerHTML = a_0_0_5_2_students.student_name_a;
            } else {
                document.getElementById("profile_user_name").innerHTML = a_0_0_5_2_students.student_name_e;
            }

            /// Emails
            document.getElementById("profile_user_email").innerHTML = a_0_0_5_2_students.student_academic_email;
            document.getElementById("student_academic_email").value = a_0_0_5_2_students.student_academic_email;
            document.getElementById("student_personal_email").value = a_0_0_5_2_students.student_personal_email;


            //degree
            document.getElementById("student_level").value = a_0_0_5_2_students.student_level;

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

function enablesaveProfileBtn() {
    document.getElementById("saveProfile").disabled = false;
}
function update_student_profile() {
    var student_photo = document.getElementById("profile-image-2-val").value;
    var student_name_a = document.getElementById("student_name_a").value;
    var student_name_e = document.getElementById("student_name_e").value;
    var student_personal_email = document.getElementById("student_personal_email").value;
    var student_level = document.getElementById("student_level").value;
    if (student_name_e === "" || student_name_e === null) {
        if (lang_G === "ar") {
            Warning("برجاء إدخال الإسم باللغة الإنجليزية");
        } else {
            Warning("please Insert Main Tab Name In English");
        }
    } else if (student_name_e === "" || student_name_e === null) {
        if (lang_G === "ar") {
            Warning("برجاء إدخال إسم القائمة الرئيسية باللغة العربية");
        } else {
            Warning("please Insert Main Tab Name In Arabic");
        }
    } else {
        document.getElementById("saveProfile").disabled = true;
        var a_0_0_5_2_students = new Object();
        a_0_0_5_2_students.student_photo = student_photo;
        a_0_0_5_2_students.student_name_a = student_name_a;
        a_0_0_5_2_students.student_name_e = student_name_e;
        a_0_0_5_2_students.student_personal_email = student_personal_email;
        a_0_0_5_2_students.student_academic_email = general_student_academic_email;
        a_0_0_5_2_students.student_level = student_level;
        $.ajax({
            url: "_997_student_profile_001_update_student_profile_AjaxServlet?",
            type: 'POST',
            //dataType: 'json',
            data: JSON.stringify(a_0_0_5_2_students),
            //contentType: 'application/json',
            // mimeType: 'application/json',
            success: function (data) {
                if (data === "success") {
                    if (lang_G === "ar") {
                        Success("تم حفظ البيانات");
                    } else {
                        Success("Data Saved");
                        setTimeout(enablesaveProfileBtn, 10000);
                    }
                    get_student_profile_data(general_student_academic_email);
                } else {
                    Error("Error");
                }
                get_student_profile_data(general_student_academic_email);
            },
            error: function (xhr, status) {
                if (lang_G === "ar") {
                    Error("حدث خطأ");
                } else {
                    Error("Error");
                }
                get_student_profile_data(general_student_academic_email);
            }
        });
    }
}

function change_student_password() {
    var current_password = document.getElementById("current_password").value;
    var new_password_1 = document.getElementById("new_password_1").value;
    var new_password_2 = document.getElementById("new_password_2").value;
    if (new_password_1 !== new_password_2) {
        var message;
        if (lang_G === "ar") {
            message = "تأكد من تطابق كلمة المرور الجديدة والإعادة";
        } else {
            message = "ensure that new password is the same of the repetition";
        }
        Warning(message);
    } else if (new_password_1.length < password_length) {
        if (lang_G === "ar") {
            Warning("كلمة المرور لا تقل عن "+password_length+" حروف");
        } else {
            Warning("Password Cant Be Less Than "+password_length+" Characters");
        }
    } else {
        var URL = "_997_student_profile_004_change_student_password_AjaxServlet?"
                + "student_academic_email=" + general_student_academic_email
                + "&current_password=" + current_password
                + "&new_password=" + new_password_1
                + "&lang=" + lang_G;
        var xhttp = new XMLHttpRequest();
        xhttp.open("POST", URL, true);
        xhttp.send();
        xhttp.onreadystatechange = function () {
            if (xhttp.readyState === 4 && xhttp.status === 200) {
                var message = xhttp.responseText;
                if (message === "Error") {
                    if (lang_G === "ar") {
                        Error("كلمة المرور الحالية غير مطابقة");
                    } else {
                        Error("Incorrect Current Password ... !");
                    }
                } else {
                    if (lang_G === "ar") {
                        Success("تم إعادة تعيين كلمة المرور");
                    } else {
                        Success("Password has been reseted");
                    }
                    document.getElementById("current_password").value = "";
                    document.getElementById("new_password_1").value = "";
                    document.getElementById("new_password_2").value = "";
                }
            }
        };
    }

}

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