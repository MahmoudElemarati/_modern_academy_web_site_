/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
function sleep(ms) {
    return new Promise(resolve => setTimeout(resolve, ms));
}

var lang_G;
var general_teacher_academic_email;
function getTeacherId(lang) {
    lang_G = lang;
    var again = true;
    var allow = true;
    var checked = false;
    while (again) {
        var messagePrompet;
        if (lang === "ar") {
            messagePrompet = "إيميل عضو هيئة التعليم";
        } else {
            messagePrompet = "Teacher Staff Academic Email";
        }
        var teacher_academic_email = prompt(messagePrompet);
        if (teacher_academic_email === "" || teacher_academic_email === null) {
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
            var URL = "_998_teacher_profile_000_get_teacher_by_id_AjaxServlet?"
                    + "lang=" + lang
                    + "&teacher_academic_email=" + teacher_academic_email;
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
                            getTeacherId(lang);
                        } else {
                            allow = false;
                            document.location.href = "_100_account_index_AccessServlet?lang=" + lang;
                        }
                    } else {
                        general_teacher_academic_email = message;
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

function setTeacherId(lang, teacher_academic_email) {
    lang_G = lang;
    general_teacher_academic_email = teacher_academic_email;
    fill_page_content();
}

async function fill_page_content() {
    await sleep(200);
    get_teacher_profile_data(general_teacher_academic_email);
    await sleep(400);
    get_teacher_courses_data(general_teacher_academic_email);
}

function get_teacher_courses_data(teacher_academic_email) {

    var URL = "_998_teacher_profile_003_get_teacher_courses_data_AjaxServlet?"
            + "teacher_academic_email=" + teacher_academic_email
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

function get_teacher_profile_data(teacher_academic_email) {
    var a_0_9_9_9_teachers = new Object();
    a_0_9_9_9_teachers.teacher_photo = "";
    a_0_9_9_9_teachers.teacher_name_a = "";
    a_0_9_9_9_teachers.teacher_name_e = "";
    a_0_9_9_9_teachers.teacher_linked_in = "";
    a_0_9_9_9_teachers.teacher_facebook = "";
    a_0_9_9_9_teachers.teacher_twitter = "";
    a_0_9_9_9_teachers.teacher_google_plus = "";
    a_0_9_9_9_teachers.teacher_academic_email = teacher_academic_email;
    a_0_9_9_9_teachers.teacher_type = "";
    $.ajax({
        url: "_998_teacher_profile_002_get_teacher_profile_data_AjaxServlet?",
        type: 'POST',
        dataType: 'json',
        data: JSON.stringify(a_0_9_9_9_teachers),
        //contentType: 'application/json',
        // mimeType: 'application/json',
        success: function (a_0_9_9_9_teachers) {
            //a_0_9_9_9_teachers = JSON.parse(data.toString());

            /// Photos
            var photo;
            var photo_base64;
            if (a_0_9_9_9_teachers.teacher_photo === null || a_0_9_9_9_teachers.teacher_photo === "") {
                photo = "admin/assets/images/user.png";
                photo_base64 = "";
            } else {
                photo = "data:image/jpeg;base64," + a_0_9_9_9_teachers.teacher_photo;
                photo_base64 = a_0_9_9_9_teachers.teacher_photo;
            }
            document.getElementById("profile-image-1").src = photo;
            document.getElementById("profile-image-2").src = photo;
            document.getElementById("profile-image-2-val").value = photo_base64;

            /// Names
            document.getElementById("teacher_name_a").value = a_0_9_9_9_teachers.teacher_name_a;
            document.getElementById("teacher_name_e").value = a_0_9_9_9_teachers.teacher_name_e;
            if (lang_G === "ar") {
                document.getElementById("profile_user_name").innerHTML = a_0_9_9_9_teachers.teacher_name_a;
            } else {
                document.getElementById("profile_user_name").innerHTML = a_0_9_9_9_teachers.teacher_name_e;
            }

            /// Emails
            document.getElementById("profile_user_email").innerHTML = a_0_9_9_9_teachers.teacher_academic_email;
            document.getElementById("teacher_academic_email").value = a_0_9_9_9_teachers.teacher_academic_email;

            /// Links
            var facebook_link;
            if (a_0_9_9_9_teachers.teacher_facebook === null) {
                facebook_link = "javascript:;";
            } else {
                facebook_link = a_0_9_9_9_teachers.teacher_facebook;
            }
            document.getElementById("facebook_div").setAttribute('href', facebook_link);

            var twitter_link;
            if (a_0_9_9_9_teachers.teacher_facebook === null) {
                twitter_link = "javascript:;";
            } else {
                twitter_link = a_0_9_9_9_teachers.teacher_twitter;
            }
            document.getElementById("twitter_div").setAttribute('href', twitter_link);

            var linked_in_link;
            if (a_0_9_9_9_teachers.teacher_facebook === null) {
                linked_in_link = "javascript:;";
            } else {
                linked_in_link = a_0_9_9_9_teachers.teacher_linked_in;
            }
            document.getElementById("linkedin_div").setAttribute('href', linked_in_link);

            var google_plus_link;
            if (a_0_9_9_9_teachers.teacher_facebook === null) {
                google_plus_link = "javascript:;";
            } else {
                google_plus_link = a_0_9_9_9_teachers.teacher_google_plus;
            }
            document.getElementById("google_plus_div").setAttribute('href', google_plus_link);

            document.getElementById("teacher_linked_in").value = a_0_9_9_9_teachers.teacher_linked_in;
            document.getElementById("teacher_facebook").value = a_0_9_9_9_teachers.teacher_facebook;
            document.getElementById("teacher_twitter").value = a_0_9_9_9_teachers.teacher_twitter;
            document.getElementById("teacher_google_plus").value = a_0_9_9_9_teachers.teacher_google_plus;

            //degree
            document.getElementById("teacher_type").value = a_0_9_9_9_teachers.teacher_type;

            if (!(a_0_9_9_9_teachers.position === null || a_0_9_9_9_teachers.position === "")) {
                var Title = "";
                if (lang_G === "ar") {
                    Title = "المنصب";
                } else {
                    Title = "Position";
                }

                document.getElementById("positionDiv").innerHTML = "<label class=\"col-12 col-sm-3 col-md-3 col-lg-2 col-form-label\">" + Title + "</label>"
                        + "<div class=\"col-12 col-sm-9 col-md-9 col-lg-7\">"
                        + "<input class=\"form-control\" value='" + a_0_9_9_9_teachers.position + "' readonly=\"\" id=\"teacher_position\" type=\"text\" placeholder=\"\">"
                        + "</div>";
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


function enablesaveProfileBtn() {
    document.getElementById("saveProfile").disabled = false;
}
function update_teacher_profile() {
    var teacher_photo = document.getElementById("profile-image-2-val").value;
    var teacher_name_a = document.getElementById("teacher_name_a").value;
    var teacher_name_e = document.getElementById("teacher_name_e").value;
    var teacher_linked_in = document.getElementById("teacher_linked_in").value;
    var teacher_facebook = document.getElementById("teacher_facebook").value;
    var teacher_twitter = document.getElementById("teacher_twitter").value;
    var teacher_google_plus = document.getElementById("teacher_google_plus").value;
    if (teacher_name_e === "" || teacher_name_e === null) {
        if (lang_G === "ar") {
            Warning("برجاء إدخال الإسم باللغة الإنجليزية");
        } else {
            Warning("please Insert Main Tab Name In English");
        }
    } else if (teacher_name_e === "" || teacher_name_e === null) {
        if (lang_G === "ar") {
            Warning("برجاء إدخال إسم القائمة الرئيسية باللغة العربية");
        } else {
            Warning("please Insert Main Tab Name In Arabic");
        }
    } else {
        document.getElementById("saveProfile").disabled = true;
        var a_0_9_9_9_teachers = new Object();
        a_0_9_9_9_teachers.teacher_photo = teacher_photo;
        a_0_9_9_9_teachers.teacher_name_a = teacher_name_a;
        a_0_9_9_9_teachers.teacher_name_e = teacher_name_e;
        a_0_9_9_9_teachers.teacher_linked_in = teacher_linked_in;
        a_0_9_9_9_teachers.teacher_facebook = teacher_facebook;
        a_0_9_9_9_teachers.teacher_twitter = teacher_twitter;
        a_0_9_9_9_teachers.teacher_google_plus = teacher_google_plus;
        a_0_9_9_9_teachers.teacher_type = "";
        a_0_9_9_9_teachers.teacher_academic_email = general_teacher_academic_email;
        $.ajax({
            url: "_998_teacher_profile_001_update_teacher_profile_AjaxServlet?",
            type: 'POST',
            //dataType: 'json',
            data: JSON.stringify(a_0_9_9_9_teachers),
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
                    get_teacher_profile_data(general_teacher_academic_email);
                } else {
                    Error("Error");
                }
                get_teacher_profile_data(general_teacher_academic_email);
            },
            error: function (xhr, status) {
                if (lang_G === "ar") {
                    Error("حدث خطأ");
                } else {
                    Error("Error");
                }
                get_teacher_profile_data(general_teacher_academic_email);
            }
        });
    }
}

function change_teacher_password() {
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
        var URL = "_998_teacher_profile_004_change_teacher_password_AjaxServlet?"
                + "teacher_academic_email=" + general_teacher_academic_email
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