/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
var password_length = 6;
function change_lang(link) {
    var lang = document.getElementById("lang").value;
    window.location.href = link + "?lang=" + lang;
}

function get_super_auth(lang) {
    var again = true;
    var allow = true;
    var checked = false;
    while (again) {
        var user_name = prompt("UserName");
        if (user_name === "" || user_name === null) {
            if (lang === "ar") {
                alert("برجاء كتابة اسم المستخدم الخاص");
            } else {
                alert("Please Write Special User Name");
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
        var password = prompt("Password");
        if (password === "" || password === null) {
            if (lang === "ar") {
                alert("برجاء كتابة كلمة المرور الخاص");
            } else {
                alert("Please Write Special Password");
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
            var URL = "_000_general_Ajax_000_get_super_auth_AjaxServlet?"
                    + "user_name=" + user_name
                    + "&password=" + password;
            var xhttp = new XMLHttpRequest();
            xhttp.open("POST", URL, true);
            xhttp.send();
            xhttp.onreadystatechange = function () {
                if (xhttp.readyState === 4 && xhttp.status === 200) {
                    var message = xhttp.responseText;
                    if (message === "Error") {
                        if (lang === "ar") {
                            alert("بيانات الدخول خاطئة");
                        } else {
                            alert("Wrong Login Data");
                        }
                        if (confirm("--Do You Want To Continue?")) {
                            get_super_auth(lang);
                        } else {
                            allow = false;
                            document.location.href = "_100_account_index_AccessServlet?lang=" + lang;
                        }
                    } else {

                    }
                }
            };
        }
    }
    if (allow === false) {
        document.location.href = "_100_account_index_AccessServlet?lang=" + lang;
    }
}