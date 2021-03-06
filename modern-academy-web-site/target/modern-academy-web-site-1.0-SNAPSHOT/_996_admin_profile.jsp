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
%>
<!DOCTYPE html>
<html lang="en">

    <head>
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
                        <div class="profile-bx text-center">
                            <div class="user-profile-thumb">
                                <img src="assets/images/profile/pic1.jpg" alt=""/>
                            </div>
                            <div class="profile-info">
                                <h4>Mark Andre</h4>
                                <span>mark.example@info.com</span>
                            </div>
                            <div class="profile-social">
                                <ul class="list-inline m-a0">
                                    <li><a href="#"><i class="fa fa-facebook"></i></a></li>
                                    <li><a href="#"><i class="fa fa-twitter"></i></a></li>
                                    <li><a href="#"><i class="fa fa-linkedin"></i></a></li>
                                    <li><a href="#"><i class="fa fa-google-plus"></i></a></li>
                                </ul>
                            </div>
                            <div class="profile-tabnav">
                                <ul class="nav nav-tabs">
                                    <li class="nav-item">
                                        <a class="nav-link active" data-toggle="tab" href="#courses"><i class="ti-book"></i>Courses</a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" data-toggle="tab" href="#quiz-results"><i class="ti-bookmark-alt"></i>Quiz Results </a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" data-toggle="tab" href="#edit-profile"><i class="ti-pencil-alt"></i>Edit Profile</a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" data-toggle="tab" href="#change-password"><i class="ti-lock"></i>Change Password</a>
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
                                        <h3>My Courses</h3>
                                    </div>
                                    <div class="courses-filter">
                                        <div class="clearfix">
                                            <ul id="masonry" class="ttr-gallery-listing magnific-image row">
                                                <li class="action-card col-xl-4 col-lg-6 col-md-12 col-sm-6 publish">
                                                    <div class="cours-bx">
                                                        <div class="action-box">
                                                            <img src="assets/images/courses/pic1.jpg" alt="">
                                                            <a href="#" class="btn">Read More</a>
                                                        </div>
                                                        <div class="info-bx text-center">
                                                            <h5><a href="#">Introduction EduChamp – LMS plugin</a></h5>
                                                            <span>Programming</span>
                                                        </div>
                                                        <div class="cours-more-info">
                                                            <div class="review">
                                                                <span>3 Review</span>
                                                                <ul class="cours-star">
                                                                    <li class="active"><i class="fa fa-star"></i></li>
                                                                    <li class="active"><i class="fa fa-star"></i></li>
                                                                    <li class="active"><i class="fa fa-star"></i></li>
                                                                    <li><i class="fa fa-star"></i></li>
                                                                    <li><i class="fa fa-star"></i></li>
                                                                </ul>
                                                            </div>
                                                            <div class="price">
                                                                <del>$190</del>
                                                                <h5>$120</h5>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </li>
                                                <li class="action-card col-xl-4 col-lg-6 col-md-12 col-sm-6 pending">
                                                    <div class="cours-bx">
                                                        <div class="action-box">
                                                            <img src="assets/images/courses/pic2.jpg" alt="">
                                                            <a href="#" class="btn">Read More</a>
                                                        </div>
                                                        <div class="info-bx text-center">
                                                            <h5><a href="#">Introduction EduChamp – LMS plugin</a></h5>
                                                            <span>Programming</span>
                                                        </div>
                                                        <div class="cours-more-info">
                                                            <div class="review">
                                                                <span>3 Review</span>
                                                                <ul class="cours-star">
                                                                    <li class="active"><i class="fa fa-star"></i></li>
                                                                    <li class="active"><i class="fa fa-star"></i></li>
                                                                    <li class="active"><i class="fa fa-star"></i></li>
                                                                    <li><i class="fa fa-star"></i></li>
                                                                    <li><i class="fa fa-star"></i></li>
                                                                </ul>
                                                            </div>
                                                            <div class="price">
                                                                <del>$190</del>
                                                                <h5>$120</h5>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </li>
                                                <li class="action-card col-xl-4 col-lg-6 col-md-12 col-sm-6 publish">
                                                    <div class="cours-bx">
                                                        <div class="action-box">
                                                            <img src="assets/images/courses/pic3.jpg" alt="">
                                                            <a href="#" class="btn">Read More</a>
                                                        </div>
                                                        <div class="info-bx text-center">
                                                            <h5><a href="#">Introduction EduChamp – LMS plugin</a></h5>
                                                            <span>Programming</span>
                                                        </div>
                                                        <div class="cours-more-info">
                                                            <div class="review">
                                                                <span>3 Review</span>
                                                                <ul class="cours-star">
                                                                    <li class="active"><i class="fa fa-star"></i></li>
                                                                    <li class="active"><i class="fa fa-star"></i></li>
                                                                    <li class="active"><i class="fa fa-star"></i></li>
                                                                    <li><i class="fa fa-star"></i></li>
                                                                    <li><i class="fa fa-star"></i></li>
                                                                </ul>
                                                            </div>
                                                            <div class="price">
                                                                <del>$190</del>
                                                                <h5>$120</h5>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </li>
                                                <li class="action-card col-xl-4 col-lg-6 col-md-12 col-sm-6 pending">
                                                    <div class="cours-bx">
                                                        <div class="action-box">
                                                            <img src="assets/images/courses/pic4.jpg" alt="">
                                                            <a href="#" class="btn">Read More</a>
                                                        </div>
                                                        <div class="info-bx text-center">
                                                            <h5><a href="#">Introduction EduChamp – LMS plugin</a></h5>
                                                            <span>Programming</span>
                                                        </div>
                                                        <div class="cours-more-info">
                                                            <div class="review">
                                                                <span>3 Review</span>
                                                                <ul class="cours-star">
                                                                    <li class="active"><i class="fa fa-star"></i></li>
                                                                    <li class="active"><i class="fa fa-star"></i></li>
                                                                    <li class="active"><i class="fa fa-star"></i></li>
                                                                    <li><i class="fa fa-star"></i></li>
                                                                    <li><i class="fa fa-star"></i></li>
                                                                </ul>
                                                            </div>
                                                            <div class="price">
                                                                <del>$190</del>
                                                                <h5>$120</h5>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </li>
                                                <li class="action-card col-xl-4 col-lg-6 col-md-12 col-sm-6 publish">
                                                    <div class="cours-bx">
                                                        <div class="action-box">
                                                            <img src="assets/images/courses/pic5.jpg" alt="">
                                                            <a href="#" class="btn">Read More</a>
                                                        </div>
                                                        <div class="info-bx text-center">
                                                            <h5><a href="#">Introduction EduChamp – LMS plugin</a></h5>
                                                            <span>Programming</span>
                                                        </div>
                                                        <div class="cours-more-info">
                                                            <div class="review">
                                                                <span>3 Review</span>
                                                                <ul class="cours-star">
                                                                    <li class="active"><i class="fa fa-star"></i></li>
                                                                    <li class="active"><i class="fa fa-star"></i></li>
                                                                    <li class="active"><i class="fa fa-star"></i></li>
                                                                    <li><i class="fa fa-star"></i></li>
                                                                    <li><i class="fa fa-star"></i></li>
                                                                </ul>
                                                            </div>
                                                            <div class="price">
                                                                <del>$190</del>
                                                                <h5>$120</h5>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </li>
                                                <li class="action-card col-xl-4 col-lg-6 col-md-12 col-sm-6 pending">
                                                    <div class="cours-bx">
                                                        <div class="action-box">
                                                            <img src="assets/images/courses/pic6.jpg" alt="">
                                                            <a href="#" class="btn">Read More</a>
                                                        </div>
                                                        <div class="info-bx text-center">
                                                            <h5><a href="#">Introduction EduChamp – LMS plugin</a></h5>
                                                            <span>Programming</span>
                                                        </div>
                                                        <div class="cours-more-info">
                                                            <div class="review">
                                                                <span>3 Review</span>
                                                                <ul class="cours-star">
                                                                    <li class="active"><i class="fa fa-star"></i></li>
                                                                    <li class="active"><i class="fa fa-star"></i></li>
                                                                    <li class="active"><i class="fa fa-star"></i></li>
                                                                    <li><i class="fa fa-star"></i></li>
                                                                    <li><i class="fa fa-star"></i></li>
                                                                </ul>
                                                            </div>
                                                            <div class="price">
                                                                <del>$190</del>
                                                                <h5>$120</h5>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </li>
                                                <li class="action-card col-xl-4 col-lg-6 col-md-12 col-sm-6 publish">
                                                    <div class="cours-bx">
                                                        <div class="action-box">
                                                            <img src="assets/images/courses/pic7.jpg" alt="">
                                                            <a href="#" class="btn">Read More</a>
                                                        </div>
                                                        <div class="info-bx text-center">
                                                            <h5><a href="#">Introduction EduChamp – LMS plugin</a></h5>
                                                            <span>Programming</span>
                                                        </div>
                                                        <div class="cours-more-info">
                                                            <div class="review">
                                                                <span>3 Review</span>
                                                                <ul class="cours-star">
                                                                    <li class="active"><i class="fa fa-star"></i></li>
                                                                    <li class="active"><i class="fa fa-star"></i></li>
                                                                    <li class="active"><i class="fa fa-star"></i></li>
                                                                    <li><i class="fa fa-star"></i></li>
                                                                    <li><i class="fa fa-star"></i></li>
                                                                </ul>
                                                            </div>
                                                            <div class="price">
                                                                <del>$190</del>
                                                                <h5>$120</h5>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </li>
                                                <li class="action-card col-xl-4 col-lg-6 col-md-12 col-sm-6 book">
                                                    <div class="cours-bx">
                                                        <div class="action-box">
                                                            <img src="assets/images/courses/pic8.jpg" alt="">
                                                            <a href="#" class="btn">Read More</a>
                                                        </div>
                                                        <div class="info-bx text-center">
                                                            <h5><a href="#">Introduction EduChamp – LMS plugin</a></h5>
                                                            <span>Programming</span>
                                                        </div>
                                                        <div class="cours-more-info">
                                                            <div class="review">
                                                                <span>3 Review</span>
                                                                <ul class="cours-star">
                                                                    <li class="active"><i class="fa fa-star"></i></li>
                                                                    <li class="active"><i class="fa fa-star"></i></li>
                                                                    <li class="active"><i class="fa fa-star"></i></li>
                                                                    <li><i class="fa fa-star"></i></li>
                                                                    <li><i class="fa fa-star"></i></li>
                                                                </ul>
                                                            </div>
                                                            <div class="price">
                                                                <del>$190</del>
                                                                <h5>$120</h5>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </li>
                                                <li class="action-card col-xl-4 col-lg-6 col-md-12 col-sm-6 publish">
                                                    <div class="cours-bx">
                                                        <div class="action-box">
                                                            <img src="assets/images/courses/pic9.jpg" alt="">
                                                            <a href="#" class="btn">Read More</a>
                                                        </div>
                                                        <div class="info-bx text-center">
                                                            <h5><a href="#">Introduction EduChamp – LMS plugin</a></h5>
                                                            <span>Programming</span>
                                                        </div>
                                                        <div class="cours-more-info">
                                                            <div class="review">
                                                                <span>3 Review</span>
                                                                <ul class="cours-star">
                                                                    <li class="active"><i class="fa fa-star"></i></li>
                                                                    <li class="active"><i class="fa fa-star"></i></li>
                                                                    <li class="active"><i class="fa fa-star"></i></li>
                                                                    <li><i class="fa fa-star"></i></li>
                                                                    <li><i class="fa fa-star"></i></li>
                                                                </ul>
                                                            </div>
                                                            <div class="price">
                                                                <del>$190</del>
                                                                <h5>$120</h5>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                                <div class="tab-pane" id="quiz-results">
                                    <div class="profile-head">
                                        <h3>Quiz Results</h3>
                                    </div>
                                    <div class="courses-filter">
                                        <div class="row">
                                            <div class="col-md-6 col-lg-6">
                                                <ul class="course-features">
                                                    <li><i class="ti-book"></i> <span class="label">Lectures</span> <span class="value">8</span></li>
                                                    <li><i class="ti-help-alt"></i> <span class="label">Quizzes</span> <span class="value">1</span></li>
                                                    <li><i class="ti-time"></i> <span class="label">Duration</span> <span class="value">60 hours</span></li>
                                                    <li><i class="ti-stats-up"></i> <span class="label">Skill level</span> <span class="value">Beginner</span></li>
                                                    <li><i class="ti-smallcap"></i> <span class="label">Language</span> <span class="value">English</span></li>
                                                    <li><i class="ti-user"></i> <span class="label">Students</span> <span class="value">32</span></li>
                                                    <li><i class="ti-check-box"></i> <span class="label">Assessments</span> <span class="value">Yes</span></li>
                                                </ul>
                                            </div>
                                            <div class="col-md-6 col-lg-6">
                                                <ul class="course-features">
                                                    <li><i class="ti-book"></i> <span class="label">Lectures</span> <span class="value">8</span></li>
                                                    <li><i class="ti-help-alt"></i> <span class="label">Quizzes</span> <span class="value">1</span></li>
                                                    <li><i class="ti-time"></i> <span class="label">Duration</span> <span class="value">60 hours</span></li>
                                                    <li><i class="ti-stats-up"></i> <span class="label">Skill level</span> <span class="value">Beginner</span></li>
                                                    <li><i class="ti-smallcap"></i> <span class="label">Language</span> <span class="value">English</span></li>
                                                    <li><i class="ti-user"></i> <span class="label">Students</span> <span class="value">32</span></li>
                                                    <li><i class="ti-check-box"></i> <span class="label">Assessments</span> <span class="value">Yes</span></li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="tab-pane" id="edit-profile">
                                    <div class="profile-head">
                                        <h3>Edit Profile</h3>
                                    </div>
                                    <form class="edit-profile">
                                        <div class="">
                                            <div class="form-group row">
                                                <div class="col-12 col-sm-9 col-md-9 col-lg-10 ml-auto">
                                                    <h3>1. Personal Details</h3>
                                                </div>
                                            </div>
                                            <div class="form-group row">
                                                <label class="col-12 col-sm-3 col-md-3 col-lg-2 col-form-label">Full Name</label>
                                                <div class="col-12 col-sm-9 col-md-9 col-lg-7">
                                                    <input class="form-control" type="text" value="Mark Andre">
                                                </div>
                                            </div>
                                            <div class="form-group row">
                                                <label class="col-12 col-sm-3 col-md-3 col-lg-2 col-form-label">Occupation</label>
                                                <div class="col-12 col-sm-9 col-md-9 col-lg-7">
                                                    <input class="form-control" type="text" value="CTO">
                                                </div>
                                            </div>
                                            <div class="form-group row">
                                                <label class="col-12 col-sm-3 col-md-3 col-lg-2 col-form-label">Company Name</label>
                                                <div class="col-12 col-sm-9 col-md-9 col-lg-7">
                                                    <input class="form-control" type="text" value="EduChamp">
                                                    <span class="help">If you want your invoices addressed to a company. Leave blank to use your full name.</span>
                                                </div>
                                            </div>
                                            <div class="form-group row">
                                                <label class="col-12 col-sm-3 col-md-3 col-lg-2 col-form-label">Phone No.</label>
                                                <div class="col-12 col-sm-9 col-md-9 col-lg-7">
                                                    <input class="form-control" type="text" value="+120 012345 6789">
                                                </div>
                                            </div>

                                            <div class="seperator"></div>

                                            <div class="form-group row">
                                                <div class="col-12 col-sm-9 col-md-9 col-lg-10 ml-auto">
                                                    <h3>2. Address</h3>
                                                </div>
                                            </div>
                                            <div class="form-group row">
                                                <label class="col-12 col-sm-3 col-md-3 col-lg-2 col-form-label">Address</label>
                                                <div class="col-12 col-sm-9 col-md-9 col-lg-7">
                                                    <input class="form-control" type="text" value="5-S2-20 Dummy City, UK">
                                                </div>
                                            </div>
                                            <div class="form-group row">
                                                <label class="col-12 col-sm-3 col-md-3 col-lg-2 col-form-label">City</label>
                                                <div class="col-12 col-sm-9 col-md-9 col-lg-7">
                                                    <input class="form-control" type="text" value="US">
                                                </div>
                                            </div>
                                            <div class="form-group row">
                                                <label class="col-12 col-sm-3 col-md-3 col-lg-2 col-form-label">State</label>
                                                <div class="col-12 col-sm-9 col-md-9 col-lg-7">
                                                    <input class="form-control" type="text" value="California">
                                                </div>
                                            </div>
                                            <div class="form-group row">
                                                <label class="col-12 col-sm-3 col-md-3 col-lg-2 col-form-label">Postcode</label>
                                                <div class="col-12 col-sm-9 col-md-9 col-lg-7">
                                                    <input class="form-control" type="text" value="000702">
                                                </div>
                                            </div>

                                            <div class="m-form__seperator m-form__seperator--dashed m-form__seperator--space-2x"></div>

                                            <div class="form-group row">
                                                <div class="col-12 col-sm-9 col-md-9 col-lg-10 ml-auto">
                                                    <h3 class="m-form__section">3. Social Links</h3>
                                                </div>
                                            </div>

                                            <div class="form-group row">
                                                <label class="col-12 col-sm-3 col-md-3 col-lg-2 col-form-label">Linkedin</label>
                                                <div class="col-12 col-sm-9 col-md-9 col-lg-7">
                                                    <input class="form-control" type="text" value="www.linkedin.com">
                                                </div>
                                            </div>
                                            <div class="form-group row">
                                                <label class="col-12 col-sm-3 col-md-3 col-lg-2 col-form-label">Facebook</label>
                                                <div class="col-12 col-sm-9 col-md-9 col-lg-7">
                                                    <input class="form-control" type="text" value="www.facebook.com">
                                                </div>
                                            </div>
                                            <div class="form-group row">
                                                <label class="col-12 col-sm-3 col-md-3 col-lg-2 col-form-label">Twitter</label>
                                                <div class="col-12 col-sm-9 col-md-9 col-lg-7">
                                                    <input class="form-control" type="text" value="www.twitter.com">
                                                </div>
                                            </div>
                                            <div class="form-group row">
                                                <label class="col-12 col-sm-3 col-md-3 col-lg-2 col-form-label">Instagram</label>
                                                <div class="col-12 col-sm-9 col-md-9 col-lg-7">
                                                    <input class="form-control" type="text" value="www.instagram.com">
                                                </div>
                                            </div>
                                        </div>
                                        <div class="">
                                            <div class="">
                                                <div class="row">
                                                    <div class="col-12 col-sm-3 col-md-3 col-lg-2">
                                                    </div>
                                                    <div class="col-12 col-sm-9 col-md-9 col-lg-7">
                                                        <button type="reset" class="btn">Save changes</button>
                                                        <button type="reset" class="btn-secondry">Cancel</button>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                                <div class="tab-pane" id="change-password">
                                    <div class="profile-head">
                                        <h3>Change Password</h3>
                                    </div>
                                    <form class="edit-profile">
                                        <div class="">
                                            <div class="form-group row">
                                                <div class="col-12 col-sm-8 col-md-8 col-lg-9 ml-auto">
                                                    <h3>Password</h3>
                                                </div>
                                            </div>
                                            <div class="form-group row">
                                                <label class="col-12 col-sm-4 col-md-4 col-lg-3 col-form-label">Current Password</label>
                                                <div class="col-12 col-sm-8 col-md-8 col-lg-7">
                                                    <input class="form-control" type="password" value="">
                                                </div>
                                            </div>
                                            <div class="form-group row">
                                                <label class="col-12 col-sm-4 col-md-4 col-lg-3 col-form-label">New Password</label>
                                                <div class="col-12 col-sm-8 col-md-8 col-lg-7">
                                                    <input class="form-control" type="password" value="">
                                                </div>
                                            </div>
                                            <div class="form-group row">
                                                <label class="col-12 col-sm-4 col-md-4 col-lg-3 col-form-label">Re Type New Password</label>
                                                <div class="col-12 col-sm-8 col-md-8 col-lg-7">
                                                    <input class="form-control" type="password" value="">
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-12 col-sm-4 col-md-4 col-lg-3">
                                            </div>
                                            <div class="col-12 col-sm-8 col-md-8 col-lg-7">
                                                <button type="reset" class="btn">Save changes</button>
                                                <button type="reset" class="btn-secondry">Cancel</button>
                                            </div>
                                        </div>

                                    </form>
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

        <!-- PNotify -->
        <script src="assets/vendors/pnotify/dist/pnotify.js"></script>
        <script src="assets/vendors/pnotify/dist/pnotify.buttons.js"></script>

        <!-- Tree -->
        <script src="assets/vendors/tree/tree.js"></script>

        <script src="_000_lang.js"></script>
        <script src="_204_teaching_staff_control_pages.js"></script>



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
%>