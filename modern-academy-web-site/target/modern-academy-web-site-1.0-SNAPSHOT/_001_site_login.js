/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
var lang_G;
function get_lang(lang) {
    lang_G = lang;
}

window.addEventListener('keypress', function (e) {
    if (e.keyCode === 13) {
        login();
    }
}, false);


function login() {
    var username = document.getElementById("username").value;
    var password = document.getElementById("password").value;
    if (username === "" || username === null) {
        Warning("برجاء إدخال  اسم المستخدم");
        document.getElementById('username').style.borderColor = "red";
    } else if (password === "" || password === null) {
        Warning("برجاء إدخال  كلمة المرور");
        document.getElementById('password').style.borderColor = "red";
        document.getElementById('username').style.borderColor = "#737373";
    } else {
        var URL = "_001_site_login_AjaxServlet?username=" + username + "&password=" + password + "&lang=" + lang_G;

        var xhttp = new XMLHttpRequest();
        xhttp.open("POST", URL, true);

        xhttp.send();

        xhttp.onreadystatechange = function () {
            if (xhttp.readyState === 4 && xhttp.status === 200) {
                var message = xhttp.responseText;
                //==SUCCESS IS A ALERT VAR WHICH DECLARED IN THE END OF CODE==============
                if (message === "Success") {
                    window.location = '_002_site_login_ControlServlet?username=' + username + "&password=" + password + "&lang=" + lang_G;
                } else {
                    // Error Action to Current Page.
                    Warning(message);
                }
            }
        };
    }
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