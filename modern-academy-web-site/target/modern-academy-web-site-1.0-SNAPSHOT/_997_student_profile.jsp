<%-- 
    Document   : _100_account_index
    Created on : Jan 27, 2021, 9:00:31 PM
    Author     : Mahmoud
--%>

<%@page import="com.modern.www._1_3_MySql_DB_daos.A0003SubTabs_DAO"%>
<%@page import="com.modern.www._1_2_MySql_DB_entities.A0003SubTabs"%>
<%@page import="com.modern.www._1_3_MySql_DB_daos.A0002Tabs_DAO"%>
<%@page import="com.modern.www._1_2_MySql_DB_entities.A0002Tabs"%>
<%@page import="com.modern.www._1_3_MySql_DB_daos.A0001MainTabs_DAO"%>
<%@page import="com.modern.www._1_2_MySql_DB_entities.A0001MainTabs"%>
<%@page import="java.util.List"%>
<%@page import="com.modern.www._1_1_MySql_DB_mainDao.HibernateSessionConMySql"%>
<%@page import="com.modern.www._0_3_Elemarati_pages_control._000_session_needs"%>
<%@page import="com.modern.www._0_3_Elemarati_pages_control._001_manage_sessions"%>
<%@page import="com.modern.www._1_2_MySql_DB_entities.A0052Students"%>
<%@page import="com.modern.www._1_2_MySql_DB_entities.A9999AdminUsers"%>
<%@page import="com.modern.www._0_2_Elemarati_WebSettings._000_navbarMenu"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    HibernateSessionConMySql.MySQL_OpenCon();
    HibernateSessionConMySql.session.clear();
    try {
        String HTMLBody = (String) request.getSession().getAttribute("OpenHTMLFile");
        if (HTMLBody.equals("Open")) {

            String lang = request.getParameter("lang");
            if (lang.equals("null")) {
                lang = "en";
            }
            _000_session_needs session_needs = new _001_manage_sessions().get_Std_Admin_Session(request, lang);
            String user_name = session_needs.getUser_name();
            String photo = session_needs.getPhoto();
            String current_page_accessServlet = session_needs.getCurrent_page_accessServlet();
            String current_page_name = (lang.equals("ar")) ? session_needs.getCurrent_page_ar_name() : session_needs.getCurrent_page_en_name();
            String account_type = session_needs.getAccount_type();
            String user_id = session_needs.getUser_id();
            String user_name_or_academic_email = session_needs.getUser_name_or_academic_email();

%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <script src="_000_lang.js"></script>
        <script src="_997_student_profile.js"></script>
        <script>
            <%                if (account_type.equals("account")) {
            %>
            setStudentId('<%=lang%>', '<%=user_name_or_academic_email%>');
            <%
            } else {
            %>
            getStudentId('<%=lang%>');
            <%
                }
            %>
        </script>
        <!-- META ============================================= -->
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="keywords" content="" />
        <meta name="author" content="" />
        <meta name="robots" content="" />

        <!-- DESCRIPTION -->
        <meta name="description" content="EduChamp : Education HTML Template" />

        <!-- OG -->
        <meta property="og:title" content="EduChamp : Education HTML Template" />
        <meta property="og:description" content="EduChamp : Education HTML Template" />
        <meta property="og:image" content="" />
        <meta name="format-detection" content="telephone=no">

        <!-- FAVICONS ICON ============================================= -->
        <link rel="icon" href="assets/images/favicon.ico" type="image/x-icon" />
        <link rel="shortcut icon" type="image/x-icon" href="admin/assets/images/favicon.png" />

        <!-- PAGE TITLE HERE ============================================= -->
        <title>Modern Academy - Admin | Admin Pages </title>

        <!-- MOBILE SPECIFIC ============================================= -->
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <!--[if lt IE 9]>
        <script src="admin/assets/js/html5shiv.min.js"></script>
        <script src="admin/assets/js/respond.min.js"></script>
        <[endif]-->

        <!-- All PLUGINS CSS ============================================= -->
        <link rel="stylesheet" type="text/css" href="admin/assets/css/assets.css">
        <link rel="stylesheet" type="text/css" href="admin/assets/vendors/calendar/fullcalendar.css">
        <link rel="stylesheet" type="text/css" href="admin/assets/vendors/summernote/summernote.css">
        <link rel="stylesheet" type="text/css" href="admin/assets/vendors/file-upload/imageuploadify.min.css">
        <!-- TYPOGRAPHY ============================================= -->
        <link rel="stylesheet" type="text/css" href="admin/assets/css/typography.css">

        <!-- SHORTCODES ============================================= -->
        <link rel="stylesheet" type="text/css" href="admin/assets/css/shortcodes/shortcodes.css">

        <!-- STYLESHEETS ============================================= -->
        <link rel="stylesheet" type="text/css" href="admin/assets/css/style.css">
        <link rel="stylesheet" type="text/css" href="admin/assets/css/dashboard.css">
        <link class="skin" rel="stylesheet" type="text/css" href="admin/assets/css/color/color-1.css">

        <!-- Tree -->
        <link href="assets/vendors/tree/tree.css" rel="stylesheet">

        <!-- PNotify -->
        <link href="assets/vendors/pnotify/dist/pnotify.css" rel="stylesheet">
        <link href="assets/vendors/pnotify/dist/pnotify.buttons.css" rel="stylesheet">

        <!-- BootStrap ================================================ -->
        <link href="assets/vendors/bootstrap/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">


        <style>
            .icon {
                padding: 10px;
                background: white;
                color: #495057;
                min-width: 50px;
                text-align: center;
                border: solid 1px #ced4da;
                border-radius: 4px;
            }
        </style>
    </head>
    <body class="ttr-opened-sidebar ttr-pinned-sidebar">

        <!-- header start -->
        <header class="ttr-header">
            <div class="ttr-header-wrapper">
                <!--sidebar menu toggler start -->
                <div class="ttr-toggle-sidebar ttr-material-button">
                    <i class="ti-close ttr-open-icon"></i>
                    <i class="ti-menu ttr-close-icon"></i>
                </div>
                <!--sidebar menu toggler end -->
                <!--logo start -->
                <div class="ttr-logo-box">
                    <div>
                        <a href="_100_account_index_AccessServlet?lang=<%=lang%>" class="ttr-logo">
                            <img alt="" class="ttr-logo-mobile" src="admin/assets/images/logo-mobile.png" width="30" height="30">
                            <img alt="" class="ttr-logo-desktop" src="admin/assets/images/logo-white.png" width="110">
                        </a>
                    </div>
                </div>
                <!--logo end -->
                <div class="ttr-header-menu">
                    <!-- header left menu start -->
                    <ul class="ttr-header-navigation">
                        <li>
                            <a href="_100_account_index_AccessServlet?lang=<%=lang%>" class="ttr-material-button ttr-submenu-toggle"><%=(lang.equals("ar")) ? "الرئيسية" : "HOME"%></a>
                        </li>
                    </ul>
                    <!-- header left menu end -->
                </div>
                <div class="ttr-header-right ttr-with-seperator">
                    <!-- header right menu start -->
                    <ul class="ttr-header-navigation">
                        <li>
                            <a href="#" class="ttr-material-button ttr-submenu-toggle"><i class="fa fa-bell"></i></a>
                            <div class="ttr-header-submenu noti-menu">
                                <div class="ttr-notify-header">
                                    <span class="ttr-notify-text-top">9 New</span>
                                    <span class="ttr-notify-text">User Notifications</span>
                                </div>
                                <div class="noti-box-list">
                                    <ul>

                                    </ul>
                                </div>
                            </div>
                        </li>
                        <li>
                            <a href="javascript:;" class="ttr-material-button ttr-submenu-toggle"><%=user_name%></a>
                        </li>
                        <li>
                            <a href="#" class="ttr-material-button ttr-submenu-toggle"><span class="ttr-user-avatar"><img alt="" src="<%=photo%>" width="32" height="32"></span></a>
                            <div class="ttr-header-submenu">
                                <ul>
                                    <%                            //
                                        String user_navbar = new _000_navbarMenu().getUserNavBar(account_type, lang);
                                    %>
                                    <%=user_navbar%>                                    
                                </ul>
                            </div>
                        </li>
                        <li>
                            <select class="header-lang-bx select2" id="lang" onchange="change_lang('<%=request.getContextPath()%>/<%=current_page_accessServlet%>');">
                                <option value="en" data-icon="flag flag-us" <%=(lang.equals("en")) ? "selected" : ""%> >English US</option>
                                <option value="ar" data-icon="flag flag-eg" <%=(lang.equals("ar")) ? "selected" : ""%> >Arabic EGY</option>
                            </select>
                        </li>                       
                    </ul>
                    <!-- header right menu end -->
                </div>
                <!--header search panel start -->
                <div class="ttr-search-bar">
                    <form class="ttr-search-form">
                        <div class="ttr-search-input-wrapper">
                            <input type="text" name="qq" placeholder="search something..." class="ttr-search-input">
                            <button type="submit" name="search" class="ttr-search-submit"><i class="ti-arrow-right"></i></button>
                        </div>
                        <span class="ttr-search-close ttr-search-toggle">
                            <i class="ti-close"></i>
                        </span>
                    </form>
                </div>
                <!--header search panel end -->
            </div>
        </header>
        <!-- header end -->
        <!-- Left sidebar menu start -->
        <div class="ttr-sidebar">
            <div class="ttr-sidebar-wrapper content-scroll">
                <!-- side menu logo start -->
                <div class="ttr-sidebar-logo">
                    <a href="#" style="margin: 3px 60px;"><img alt="" src="admin/assets/images/logo-white.png" width="110"></a>
                    <!-- <div class="ttr-sidebar-pin-button" title="Pin/Unpin Menu">
                            <i class="material-icons ttr-fixed-icon">gps_fixed</i>
                            <i class="material-icons ttr-not-fixed-icon">gps_not_fixed</i>
                    </div> -->
                    <div class="ttr-sidebar-toggle-button">
                        <i class="ti-arrow-left"></i>
                    </div>
                </div>
                <!-- side menu logo end -->
                <!-- sidebar menu start -->
                <nav class="ttr-sidebar-navi">
                    <ul> 
                        <%                            //
                            String navbar = new _000_navbarMenu().getNavBar(account_type, lang);
                        %>
                        <%=navbar%>                        
                        <li class="ttr-seperate"></li>
                    </ul>
                    <!-- sidebar menu end -->
                </nav>
                <!-- sidebar menu end -->
            </div>
        </div>
        <!-- Left sidebar menu end -->

        <!--Main container start -->
        <main class="ttr-wrapper">
            <div class="container-fluid">
                <div class="db-breadcrumb">
                    <h4 class="breadcrumb-title"><%=current_page_name%></h4>
                    <ul class="db-breadcrumb-list">
                        <li><a href="#"><i class="fa fa-home"></i><%=(lang.equals("ar")) ? "الرئيسية" : "Home"%></a></li>
                        <li><%=current_page_name%></li>
                    </ul>
                </div>	                
                <div class="row">
                    <!-- Your Profile Views Chart -->
                    <div class="col-lg-3 col-md-4 col-sm-12 m-b30">
                        <div class="profile-bx text-center" id="user_main_card">
                            <div class="user-profile-thumb">
                                <img src="<%=photo%>" alt="" id="profile-image-1"/>
                            </div>
                            <div class="profile-info">
                                <h4 id="profile_user_name">Mark Andre</h4>
                                <span id="profile_user_email">mark.example@info.com</span>
                            </div>
                            <div class="profile-social">
                                <ul class="list-inline m-a0">
                                    
                                </ul>
                            </div>
                            <div class="profile-tabnav">
                                <ul class="nav nav-tabs">
                                    <li class="nav-item">
                                        <a class="nav-link active" data-toggle="tab" href="#courses"><i class="ti-book"></i><%=(lang.equals("ar") ? "الكورسات" : "Courses")%></a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" data-toggle="tab" href="#edit-profile"><i class="ti-pencil-alt"></i><%=(lang.equals("ar") ? "تعديل الملف" : "Edit Profile")%></a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" data-toggle="tab" href="#edit-cv"><i class="ti-pencil-alt"></i><%=(lang.equals("ar") ? "تعديل السيرة الذاتية" : "Edit CV")%></a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" data-toggle="tab" href="#change-password"><i class="ti-lock"></i><%=(lang.equals("ar") ? "تعديل كلمة المرور" : "Change Password")%></a>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-9 col-md-8 col-sm-12 m-b30">
                        <div class="profile-content-bx">
                            <div class="tab-content">
                                <div class="tab-pane active" id="courses">
                                    <div class="profile-head">
                                        <h3><%=(lang.equals("ar") ? "المواد" : "My Courses")%></h3>
                                    </div>
                                    <div class="courses-filter">
                                        <div class="clearfix">
                                            <ul id="masonry" class="ttr-gallery-listing magnific-image row">                                                


                                            </ul>
                                        </div>
                                    </div>
                                </div>
                                <div class="tab-pane" id="edit-profile">
                                    <div class="profile-head">
                                        <h3>Edit Profile</h3>
                                    </div>
                                    <div class="edit-profile">
                                        <div class="">
                                            <div class="form-group row">
                                                <div class="col-12 col-sm-9 col-md-9 col-lg-10 ml-auto">
                                                    <h3><%=(lang.equals("ar")) ? "1. البيانات الشخصية" : "1. Personal Data"%></h3>
                                                </div>
                                            </div>
                                            <style>
                                                .cim {
                                                    position: relative;
                                                    width: 100%;
                                                    max-width: 400px;
                                                }

                                                .cim img {
                                                    width: 100%;
                                                    height: auto;
                                                }

                                                .cim .btnn::-webkit-file-upload-button {
                                                    visibility: hidden;
                                                }
                                                .cim .btnn::before {
                                                    content: 'upload new photo';
                                                    display: inline-block;
                                                    position: absolute;
                                                    top: 60.5%;
                                                    left: 50%;
                                                    transform: translate(-50%, -50%);
                                                    -ms-transform: translate(-50%, -50%);
                                                    background-color: #55555540;
                                                    color: white;
                                                    font-size: 16px;
                                                    padding: 12px 24px;
                                                    border: none;
                                                    cursor: pointer;
                                                    border-radius: 5px;
                                                    text-align: center;
                                                    border-radius: 100px;
                                                    width: 200px;
                                                    height: 200px;
                                                }
                                                .cim .btnn:hover::before {
                                                    background-color: #5555557a;
                                                }
                                                .cim .btnn:active::before {
                                                    background: -webkit-linear-gradient(top, #e3e3e3, #f9f9f9);
                                                }

                                            </style>
                                            <div class="form-group row">
                                                <label class="col-12 col-sm-3 col-md-3 col-lg-2 col-form-label"><%=(lang.equals("ar")) ? "الصورة الشخصية" : "Personal Photo"%></label>
                                                <div class="col-12 col-sm-9 col-md-9 col-lg-7">
                                                    <div class="cim">
                                                        <input accept="image/*" type="file" class="btnn" size="50" id="filePicker" onchange="showImage.call(this)" value="" >
                                                        <img src="assets/images/profile/pic1.jpg" id="profile-image-2"
                                                             style="width: 200px; overflow: hidden; border-radius: 100px; 
                                                             border: 5px solid rgb(255, 255, 255); box-shadow: rgba(0, 0, 0, 0.2) 0px 0px 15px 0px; 
                                                             margin: 25px auto 15px; display: block;"
                                                             alt=""/>
                                                    </div> 
                                                    <textarea hidden="" id="profile-image-2-val" placeholder="Base64 will appear here" cols="50" rows="15"></textarea>
                                                </div>                                                
                                            </div>
                                            <div class="form-group row">
                                                <label class="col-12 col-sm-3 col-md-3 col-lg-2 col-form-label"><%=(lang.equals("ar")) ? "الإسم باللغة العربية" : "Name In Arabic"%></label>
                                                <div class="col-12 col-sm-9 col-md-9 col-lg-7">
                                                    <input class="form-control" id="student_name_a" type="text" placeholder="<%=(lang.equals("ar")) ? "الإسم باللغة العربية" : "Name In Arabic"%>">
                                                </div>
                                            </div>
                                            <div class="form-group row">
                                                <label class="col-12 col-sm-3 col-md-3 col-lg-2 col-form-label"><%=(lang.equals("ar")) ? "الإسم باللغة الإنجليزية" : "Name In English"%></label>
                                                <div class="col-12 col-sm-9 col-md-9 col-lg-7">
                                                    <input class="form-control" id="student_name_e" type="text" placeholder="<%=(lang.equals("ar")) ? "الإسم باللغة الإنجليزية" : "Name In English"%>">
                                                </div>
                                            </div>

                                            <div class="seperator"></div>

                                            <div class="form-group row">
                                                <div class="col-12 col-sm-9 col-md-9 col-lg-10 ml-auto">
                                                    <h3 class="m-form__section"><%=(lang.equals("ar")) ? "2. البيانات الأكاديمية" : "2. Academic Data"%></h3>
                                                </div>
                                            </div>

                                            <div class="form-group row">
                                                <label class="col-12 col-sm-3 col-md-3 col-lg-2 col-form-label"><%=(lang.equals("ar")) ? "الإيميل الأكاديمي" : "Academic Email"%></label>
                                                <div class="col-12 col-sm-9 col-md-9 col-lg-7">
                                                    <input class="form-control" readonly="" id="student_academic_email" type="text" placeholder="<%=(lang.equals("ar")) ? "الإيميل الأكاديمي" : "Academic Email"%>">
                                                </div>
                                            </div>

                                            <div class="form-group row">
                                                <label class="col-12 col-sm-3 col-md-3 col-lg-2 col-form-label"><%=(lang.equals("ar")) ? "المستوى الأكاديمي" : "Academic Level"%></label>
                                                <div class="col-12 col-sm-9 col-md-9 col-lg-7">
                                                    <input class="form-control" readonly="" id="student_level" type="text" placeholder="<%=(lang.equals("ar")) ? "المستوى الأكاديمي" : "Academic Level"%>">
                                                </div>
                                            </div>

                                            <div class="m-form__seperator m-form__seperator--dashed m-form__seperator--space-2x"></div>

                                            <div class="form-group row">
                                                <div class="col-12 col-sm-9 col-md-9 col-lg-10 ml-auto">
                                                    <h3 class="m-form__section"><%=(lang.equals("ar")) ? "3. الإيميل الخاص" : "3. Personal Email"%></h3>
                                                </div>
                                            </div>

                                            <div class="form-group row">
                                                <label class="col-12 col-sm-3 col-md-3 col-lg-2 col-form-label"><%=(lang.equals("ar")) ? "الإيميل الخاص" : "Personal Email"%></label>
                                                <div class="col-12 col-sm-9 col-md-9 col-lg-7">
                                                    <input class="form-control" type="text" id="student_personal_email" placeholder="<%=(lang.equals("ar")) ? "الإيميل الخاص" : "Personal Email"%>">
                                                </div>
                                            </div>  
                                        </div>
                                        <div class="">
                                            <div class="">
                                                <div class="row">
                                                    <div class="col-12 col-sm-3 col-md-3 col-lg-2">
                                                    </div>
                                                    <div class="col-12 col-sm-9 col-md-9 col-lg-7">
                                                        <button id="saveProfile" class="btn" onclick="update_student_profile();">Save changes</button>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="tab-pane" id="edit-cv">
                                    <div class="profile-head">
                                        <h3>Edit Profile</h3>
                                    </div>
                                    <div class="edit-profile">
                                        <div class="">
                                            <div class="form-group row">
                                                <div class="col-12 col-sm-9 col-md-9 col-lg-10 ml-auto">
                                                    <h3><%=(lang.equals("ar")) ? "1. البيانات الشخصية" : "1. Personal Data"%></h3>
                                                </div>
                                            </div>
                                            <div class="form-group row">
                                                <label class="col-12 col-sm-3 col-md-3 col-lg-2 col-form-label"><%=(lang.equals("ar")) ? "الصورة الشخصية" : "Personal Photo"%></label>
                                                <div class="col-12 col-sm-9 col-md-9 col-lg-7">
                                                    <%
                                                        if (true) {
                                                    %>
                                                    <input accept="image/*" type="file" class="form-control" size="50" id="filePicker" onchange="showImage.call(this)" value="" >
                                                    <%
                                                    } else {
                                                    %>
                                                    <input type="file" accept=".xlsx,.xls,image/*,.doc,audio/*,.docx,video/*,.ppt,.pptx,.txt,.pdf" multiple>
                                                    <%
                                                        }
                                                    %>
                                                    <img src="assets/images/profile/pic1.jpg" id="profile-image-2"
                                                         style="    
                                                         width: 200px;
                                                         overflow: hidden;
                                                         border-radius: 100px;
                                                         border: 5px solid #fff;
                                                         box-shadow: 0 0 15px 0 rgb(0 0 0 / 20%);
                                                         margin: 25px auto 15px;" 
                                                         alt=""/>
                                                    <textarea hidden="" id="profile-image-2-val" placeholder="Base64 will appear here" cols="50" rows="15"></textarea>
                                                </div>                                                
                                            </div>
                                            <div class="form-group row">
                                                <label class="col-12 col-sm-3 col-md-3 col-lg-2 col-form-label"><%=(lang.equals("ar")) ? "الإسم باللغة العربية" : "Name In Arabic"%></label>
                                                <div class="col-12 col-sm-9 col-md-9 col-lg-7">
                                                    <input class="form-control" id="student_name_a2" type="text" placeholder="<%=(lang.equals("ar")) ? "الإسم باللغة العربية" : "Name In Arabic"%>">
                                                </div>
                                            </div>
                                            <div class="form-group row">
                                                <label class="col-12 col-sm-3 col-md-3 col-lg-2 col-form-label"><%=(lang.equals("ar")) ? "الإسم باللغة الإنجليزية" : "Name In English"%></label>
                                                <div class="col-12 col-sm-9 col-md-9 col-lg-7">
                                                    <input class="form-control" id="student_name_e2" type="text" placeholder="<%=(lang.equals("ar")) ? "الإسم باللغة الإنجليزية" : "Name In English"%>">
                                                </div>
                                            </div>

                                            <div class="seperator"></div>

                                            <div class="form-group row">
                                                <div class="col-12 col-sm-9 col-md-9 col-lg-10 ml-auto">
                                                    <h3 class="m-form__section"><%=(lang.equals("ar")) ? "2. البيانات الأكاديمية" : "2. Academic Data"%></h3>
                                                </div>
                                            </div>

                                            <div class="form-group row">
                                                <label class="col-12 col-sm-3 col-md-3 col-lg-2 col-form-label"><%=(lang.equals("ar")) ? "الإيميل الأكاديمي" : "Academic Email"%></label>
                                                <div class="col-12 col-sm-9 col-md-9 col-lg-7">
                                                    <input class="form-control" readonly="" id="student_academic_email2" type="text" placeholder="<%=(lang.equals("ar")) ? "الإيميل الأكاديمي" : "Academic Email"%>">
                                                </div>
                                            </div>

                                            <div class="form-group row">
                                                <label class="col-12 col-sm-3 col-md-3 col-lg-2 col-form-label"><%=(lang.equals("ar")) ? "المستوى الأكاديمي" : "Academic Level"%></label>
                                                <div class="col-12 col-sm-9 col-md-9 col-lg-7">
                                                    <input class="form-control" readonly="" id="student_level2" type="text" placeholder="<%=(lang.equals("ar")) ? "المستوى الأكاديمي" : "Academic Level"%>">
                                                </div>
                                            </div>

                                            <div class="m-form__seperator m-form__seperator--dashed m-form__seperator--space-2x"></div>

                                            <div class="form-group row">
                                                <div class="col-12 col-sm-9 col-md-9 col-lg-10 ml-auto">
                                                    <h3 class="m-form__section"><%=(lang.equals("ar")) ? "3. الإيميل الخاص" : "3. Personal Email"%></h3>
                                                </div>
                                            </div>

                                            <div class="form-group row">
                                                <label class="col-12 col-sm-3 col-md-3 col-lg-2 col-form-label"><%=(lang.equals("ar")) ? "الإيميل الخاص" : "Personal Email"%></label>
                                                <div class="col-12 col-sm-9 col-md-9 col-lg-7">
                                                    <input class="form-control" type="text" id="student_personal_email2" placeholder="<%=(lang.equals("ar")) ? "الإيميل الخاص" : "Personal Email"%>">
                                                </div>
                                            </div>                                            
                                        </div>
                                        <div class="">
                                            <div class="">
                                                <div class="row">
                                                    <div class="col-12 col-sm-3 col-md-3 col-lg-2">
                                                    </div>
                                                    <div class="col-12 col-sm-9 col-md-9 col-lg-7">
                                                        <button class="btn" onclick="update_student_profile();">Save changes</button>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="tab-pane" id="change-password">
                                    <div class="profile-head">
                                        <h3>Change Password</h3>
                                    </div>
                                    <div class="edit-profile">
                                        <div class="">
                                            <div class="form-group row">
                                                <div class="col-12 col-sm-8 col-md-8 col-lg-9 ml-auto">
                                                    <h3>Password</h3>
                                                </div>
                                            </div>
                                            <div class="form-group row">
                                                <label class="col-12 col-sm-4 col-md-4 col-lg-3 col-form-label">Current Password</label>
                                                <div class="col-12 col-sm-8 col-md-8 col-lg-7">
                                                    <input class="form-control" id="current_password" type="password" value="">
                                                </div>
                                            </div>
                                            <div class="form-group row">
                                                <label class="col-12 col-sm-4 col-md-4 col-lg-3 col-form-label">New Password</label>
                                                <div class="col-12 col-sm-8 col-md-8 col-lg-7">
                                                    <input class="form-control" id="new_password_1" type="password" value="">
                                                </div>
                                            </div>
                                            <div class="form-group row">
                                                <label class="col-12 col-sm-4 col-md-4 col-lg-3 col-form-label">Re Type New Password</label>
                                                <div class="col-12 col-sm-8 col-md-8 col-lg-7">
                                                    <input class="form-control" id="new_password_2" type="password" value="">
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-12 col-sm-4 col-md-4 col-lg-3">
                                            </div>
                                            <div class="col-12 col-sm-8 col-md-8 col-lg-7">
                                                <button onclick="change_student_password();" class="btn">Save changes</button>
                                            </div>
                                        </div>

                                    </div>
                                </div>
                            </div> 
                        </div>
                    </div>

                    <!-- Your Profile Views Chart END-->
                </div>
            </div>
        </main>
        <div class="ttr-overlay"></div>


        <!-- External JavaScripts -->
        <script src="admin/assets/js/jquery.min.js"></script>
        <script src="admin/assets/vendors/bootstrap/js/popper.min.js"></script>
        <script src="admin/assets/vendors/bootstrap/js/bootstrap.min.js"></script>
        <script src="admin/assets/vendors/bootstrap-select/bootstrap-select.js"></script>
        <script src="admin/assets/vendors/bootstrap-touchspin/jquery.bootstrap-touchspin.js"></script>
        <script src="admin/assets/vendors/magnific-popup/magnific-popup.js"></script>
        <script src="admin/assets/vendors/counter/waypoints-min.js"></script>
        <script src="admin/assets/vendors/counter/counterup.min.js"></script>
        <script src="admin/assets/vendors/imagesloaded/imagesloaded.js"></script>
        <script src="admin/assets/vendors/masonry/masonry.js"></script>
        <script src="admin/assets/vendors/masonry/filter.js"></script>
        <script src="admin/assets/vendors/owl-carousel/owl.carousel.js"></script>
        <script src='admin/assets/vendors/scroll/scrollbar.min.js'></script>        
        <script src="admin/assets/js/functions.js"></script>
        <script src="admin/assets/vendors/chart/chart.min.js"></script>
        <script src="admin/assets/js/admin.js"></script>
        <script src="admin/assets/vendors/summernote/summernote.js"></script>
        <script src="admin/assets/vendors/file-upload/imageuploadify.min.js"></script>

        <!-- PNotify -->
        <script src="assets/vendors/pnotify/dist/pnotify.js"></script>
        <script src="assets/vendors/pnotify/dist/pnotify.buttons.js"></script>

        <!-- Tree -->
        <script src="assets/vendors/tree/tree.js"></script>  
        
        
        <script>

                                                    if (window.File && window.FileReader && window.FileList && window.Blob) {
                                                        document.getElementById('filePicker').addEventListener('change', handleFileSelect, false);
                                                    } else {
                                                        alert('الملف غير مدعم');
                                                    }
        </script>


    </body>

</html>
<%        } else { // InValid Access To the Page Exception
            response.sendRedirect("_999_error-404.html");
        }
    } catch (Exception e) {
        e.printStackTrace();
        response.sendRedirect("_999_error-404.html");
    }

    HibernateSessionConMySql.session.clear();
%>F