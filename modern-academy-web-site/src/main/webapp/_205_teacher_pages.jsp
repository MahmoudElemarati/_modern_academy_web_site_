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
        <script src="_000_lang.js"></script>
        <script>
            get_super_auth('<%=lang%>');
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
        <title>Modern Academy - Admin | Students Pages </title>

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
                            String navbar = new _000_navbarMenu().getNavBar("admin", lang);
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
                    <div class="col-lg-8 m-b30">
                        <div class="widget-box" style="height: auto;">
                            <div class="wc-title">
                                <h4><%=(lang.equals("ar")) ? "القوائم الرئيسية" : "Main Tabs"%></h4>
                            </div>
                            <div class="widget-inner"> 
                                <div class="row"> 
                                    <div class="col-md-4">
                                        <label class="col-form-label"><%=(lang.equals("ar")) ? "إسم القائمة الرئيسية باللغة الإنجليزية" : "Main Tab Name In English"%></label>
                                        <div>
                                            <input class="form-control" id="mainTabNameE" type="text" placeholder="<%=(lang.equals("ar")) ? "إسم القائمة الرئيسية باللغة الإنجليزية" : "Main Tab Name In English"%>" value="">
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <label class="col-form-label"><%=(lang.equals("ar")) ? "إسم القائمة الرئيسية باللغة العربية" : "Main Tab Name In Arabic"%></label>
                                        <div>
                                            <input class="form-control" id="mainTabNameA" type="text" placeholder="<%=(lang.equals("ar")) ? "إسم القائمة الرئيسية باللغة العربية" : "Main Tab Name In Arabic"%>" value="">
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <label class="col-form-label"><%=(lang.equals("ar")) ? "الأيقونة" : "Icon"%></label>
                                        <div style="display: flex;">
                                            <select class="form-control" onchange='changeIcon("addForm", "iconFaFa");' id="iconFaFa" type="text" placeholder="<%=(lang.equals("ar")) ? "الأيقونة" : "Icon"%>" value="">                                                
                                                <option value='ti-home' class='ti-home'>ti-home</option>
                                                <option value='ti-book' class='ti-book'>ti-book</option>
                                                <option value='ti-email' class='ti-email'>ti-email</option>
                                                <option value='ti-calendar' class='ti-calendar'>ti-calendar</option>
                                                <option value='ti-bookmark-alt' class='ti-bookmark-alt'>ti-bookmark-alt</option>
                                                <option value='ti-comments' class='ti-comments'>ti-comments</option>
                                                <option value='ti-layout-accordion-list' class='ti-layout-accordion-list'>ti-layout-accordion-list</option>
                                                <option value='ti-user' class='ti-user'>ti-user</option>
                                            </select>
                                            <i class="icon ti-home" id="addForm"></i>
                                        </div>
                                    </div>
                                    <div class="col-md-12">
                                        <label class="col-form-label"><%=(lang.equals("ar")) ? "الرابط" : "Link"%></label>
                                        <div>
                                            <input class="form-control" id="link" type="text" placeholder="<%=(lang.equals("ar")) ? "الرابط" : "Link"%>" value="">
                                        </div>
                                    </div>

                                    <div class="col-12">
                                        <br>
                                        <button type="button" onclick="add_main_tabs('teacher', '<%=lang%>');" class="btn" style="-webkit-border-radius: 100px;"><i class="fa fa-fw fa-plus-circle"></i> <%=(lang.equals("ar")) ? "حفظ" : "Save"%></button>
                                    </div>

                                    <div class="col-12">
                                        <br>

                                        <div class="table-responsive">
                                            <table class="table table-sm table-striped table-bordered table-hover" style="text-align: center;">
                                                <thead class="thead-dark">
                                                    <tr>
                                                        <th>
                                                            <%=(lang.equals("ar")) ? "إسم القائمة الرئيسية باللغة الإنجليزية" : "Main Tab Name In English"%>
                                                        </th>
                                                        <th>
                                                            <%=(lang.equals("ar")) ? "إسم القائمة الرئيسية باللغة العربية" : "Main Tab Name In Arabic"%>
                                                        </th>
                                                        <th>
                                                            <%=(lang.equals("ar")) ? "الأيقونة" : "Icon"%>
                                                        </th>
                                                        <th>
                                                            <%=(lang.equals("ar")) ? "الرابط" : "Link"%>
                                                        </th>
                                                        <th>
                                                            <%=(lang.equals("ar")) ? "الترتيب" : "order"%>
                                                        </th>
                                                        <th style="width:15%;"></th>
                                                    </tr>
                                                </thead>
                                                <tbody id="mainTabsTable">

                                                </tbody>
                                            </table>
                                        </div>
                                    </div>


                                </div>
                            </div>
                        </div>
                        <div class="col-lg-12">
                            <br>
                        </div>
                        <div class="widget-box" style="height: auto;">
                            <div class="wc-title">
                                <h4><%=(lang.equals("ar")) ? "القوائم" : "Tabs"%></h4>
                            </div>
                            <div class="widget-inner"> 
                                <div class="row"> 
                                    <div class="col-md-4">
                                        <label class="col-form-label"><%=(lang.equals("ar")) ? "القائمة الرئيسية" : "Main Tab"%></label>
                                        <div style="display: flex;">
                                            <select class="form-control" id="mainTabId" type="text" placeholder="<%=(lang.equals("ar")) ? "الأيقونة" : "Icon"%>" value="">                                                

                                            </select>                                            
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <label class="col-form-label"><%=(lang.equals("ar")) ? "إسم القائمة باللغة الإنجليزية" : "Tab Name In English"%></label>
                                        <div>
                                            <input class="form-control" id="tabNameE" type="text" placeholder="<%=(lang.equals("ar")) ? "إسم القائمة باللغة الإنجليزية" : "Tab Name In English"%>" value="">
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <label class="col-form-label"><%=(lang.equals("ar")) ? "إسم القائمة باللغة العربية" : "Tab Name In Arabic"%></label>
                                        <div>
                                            <input class="form-control" id="tabNameA" type="text" placeholder="<%=(lang.equals("ar")) ? "إسم القائمة باللغة العربية" : "Tab Name In Arabic"%>" value="">
                                        </div>
                                    </div>
                                    <div class="col-md-3">
                                        <label class="col-form-label"><%=(lang.equals("ar")) ? "الأيقونة" : "Icon"%></label>
                                        <div style="display: flex;">
                                            <select class="form-control" onchange='changeIcon("addForm_tab", "iconFaFa-2");' id="iconFaFa-2" type="text" placeholder="<%=(lang.equals("ar")) ? "الأيقونة" : "Icon"%>" value="">                                                
                                                <option value='ti-home' class='ti-home'>ti-home</option>
                                                <option value='ti-book' class='ti-book'>ti-book</option>
                                                <option value='ti-email' class='ti-email'>ti-email</option>
                                                <option value='ti-calendar' class='ti-calendar'>ti-calendar</option>
                                                <option value='ti-bookmark-alt' class='ti-bookmark-alt'>ti-bookmark-alt</option>
                                                <option value='ti-comments' class='ti-comments'>ti-comments</option>
                                                <option value='ti-layout-accordion-list' class='ti-layout-accordion-list'>ti-layout-accordion-list</option>
                                                <option value='ti-user' class='ti-user'>ti-user</option>
                                            </select>
                                            <i class="icon ti-home" id="addForm_tab"></i>
                                        </div>
                                    </div>
                                    <div class="col-md-9">
                                        <label class="col-form-label"><%=(lang.equals("ar")) ? "الرابط" : "Link"%></label>
                                        <div>
                                            <input class="form-control" id="link-tab" type="text" placeholder="<%=(lang.equals("ar")) ? "الرابط" : "Link"%>" value="">
                                        </div>
                                    </div>

                                    <div class="col-12">
                                        <br>
                                        <button type="button" onclick="add_tabs('teacher', '<%=lang%>');" class="btn" style="-webkit-border-radius: 100px;"><i class="fa fa-fw fa-plus-circle"></i> <%=(lang.equals("ar")) ? "حفظ" : "Save"%></button>
                                    </div>

                                    <div class="col-12">
                                        <br>

                                        <div class="table-responsive">
                                            <table id="TabsTable" class="table table-sm table-striped table-bordered table-hover" style="text-align: center;" >
                                                <thead class="thead-dark">
                                                    <tr>
                                                        <th>
                                                            <%=(lang.equals("ar")) ? "إسم القائمة باللغة الإنجليزية" : "Tab Name In English"%>
                                                        </th>
                                                        <th>
                                                            <%=(lang.equals("ar")) ? "إسم القائمة باللغة العربية" : "Tab Name In Arabic"%>
                                                        </th>
                                                        <th>
                                                            <%=(lang.equals("ar")) ? "الأيقونة" : "Icon"%>
                                                        </th>
                                                        <th>
                                                            <%=(lang.equals("ar")) ? "الرابط" : "Link"%>
                                                        </th>
                                                        <th>
                                                            <%=(lang.equals("ar")) ? "الترتيب" : "order"%>
                                                        </th>
                                                        <th style="width:15%;"></th>
                                                    </tr>
                                                </thead>
                                                <tbody >

                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="col-lg-4 m-b30">
                        <div class="widget-box" style="height: auto;">
                            <div class="wc-title">
                                <h4><%=(lang.equals("ar")) ? "شجرة القوائم" : "Tabs Tree"%></h4>
                            </div>
                            <div class="widget-inner">                                 

                                <ul class="myTree clt" id='myTree'>

                                </ul>

                            </div>
                        </div>
                    </div>
                    <!-- Your Profile Views Chart END-->
                </div>
            </div>
        </main>
        <div class="ttr-overlay"></div>

        <!-- Modal -->
        <div class="modal right fade  bd-example-modal-lg" id="mainTabsUpdateModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered modal-lg" style="max-width: 1000px;" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLongTitle"><%=(lang.equals("ar")) ? "تعديل القائمة الرئيسية" : "Update Main Tab"%></h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <div class="row"> 
                            <div class="col-md-4">
                                <label class="col-form-label"><%=(lang.equals("ar")) ? "إسم القائمة الرئيسية باللغة الإنجليزية" : "Main Tab Name In English"%></label>
                                <div>
                                    <input class="form-control" id="mainTabNameE-update" type="text" placeholder="<%=(lang.equals("ar")) ? "إسم القائمة الرئيسية باللغة الإنجليزية" : "Main Tab Name In English"%>" value="">
                                </div>
                            </div>
                            <div class="col-md-4">
                                <label class="col-form-label"><%=(lang.equals("ar")) ? "إسم القائمة الرئيسية باللغة العربية" : "Main Tab Name In Arabic"%></label>
                                <div>
                                    <input class="form-control" id="mainTabNameA-update" type="text" placeholder="<%=(lang.equals("ar")) ? "إسم القائمة الرئيسية باللغة العربية" : "Main Tab Name In Arabic"%>" value="">
                                </div>
                            </div>
                            <div class="col-md-3">
                                <label class="col-form-label"><%=(lang.equals("ar")) ? "الأيقونة" : "Icon"%></label>
                                <div style="display: flex;">
                                    <select class="form-control" onchange='changeIcon("updateForm-tab", "iconFaFa-update");' id="iconFaFa-update" type="text" placeholder="<%=(lang.equals("ar")) ? "الأيقونة" : "Icon"%>" value="">                                                
                                        <option value='ti-home' class='ti-home'>ti-home</option>
                                        <option value='ti-book' class='ti-book'>ti-book</option>
                                        <option value='ti-email' class='ti-email'>ti-email</option>
                                        <option value='ti-calendar' class='ti-calendar'>ti-calendar</option>
                                        <option value='ti-bookmark-alt' class='ti-bookmark-alt'>ti-bookmark-alt</option>
                                        <option value='ti-comments' class='ti-comments'>ti-comments</option>
                                        <option value='ti-layout-accordion-list' class='ti-layout-accordion-list'>ti-layout-accordion-list</option>
                                        <option value='ti-user' class='ti-user'>ti-user</option>
                                    </select>
                                    <i class="icon ti-home" id="updateForm-tab"></i>
                                </div>
                            </div>
                            <div class="col-md-3">
                                <label class="col-form-label"><%=(lang.equals("ar")) ? "الرابط" : "Link"%></label>
                                <div>
                                    <input class="form-control" id="link-update" type="text" placeholder="<%=(lang.equals("ar")) ? "الرابط" : "Link"%>" value="">
                                </div>
                            </div>

                            <div class="col-md-3">
                                <label class="col-form-label"><%=(lang.equals("ar")) ? "الترتيب" : "index"%></label>
                                <div>
                                    <input class="form-control" id="index-update" type="text" placeholder="<%=(lang.equals("ar")) ? "الترتيب" : "index"%>" value="">
                                </div>
                            </div>

                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn-secondry add-item m-r5 radius-xl" data-dismiss="modal"><i class="fa fa-fw fa-close"></i> <%=(lang.equals("ar")) ? "إلغاء" : "Cancel"%></button>
                        <button type="button" onclick="update_main_tabs('', '', '', '', '', '', 'teacher', 'update-modal', '<%=lang%>')" class="btn" style="-webkit-border-radius: 100px;"><i class="fa fa-fw fa-edit"></i> <%=(lang.equals("ar")) ? "تعديل" : "Update"%></button>
                    </div>
                </div>
            </div>
        </div>

        <!-- Modal -->
        <div class="modal right fade  bd-example-modal-lg" id="mainTabsDeleteModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered modal-lg" style="max-width: 1000px;" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLongTitle"><%=(lang.equals("ar")) ? "حذف القائمة" : "Delete Tab"%></h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <div style="text-align: Center;">
                            <h1 style="color: #dc3545;"><%=(lang.equals("ar")) ? "هل أنت متأكد من عملية الحذف تلك؟" : "Are you sure of this deletion"%></h1>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn-secondry add-item m-r5 radius-xl" data-dismiss="modal"><i class="fa fa-fw fa-close"></i> <%=(lang.equals("ar")) ? "إلغاء" : "Cancel"%></button>
                        <button type="button" onclick="delete_main_Tabs('', 'teacher', 'delete-modal', '<%=lang%>')" class="btn-danger" style="-webkit-border-radius: 100px;"><i class="fa fa-fw fa-close"></i> <%=(lang.equals("ar")) ? "حذف" : "Delete"%></button>
                    </div>
                </div>
            </div>
        </div>

        <!-- Modal -->
        <div class="modal right fade  bd-example-modal-lg" id="TabsUpdateModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered modal-lg" style="max-width: 1000px;" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLongTitle"><%=(lang.equals("ar")) ? "تعديل القائمة" : "Update Tab"%></h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <div class="row">
                            <div class="col-md-4">
                                <label class="col-form-label"><%=(lang.equals("ar")) ? "إسم القائمة باللغة الإنجليزية" : "Tab Name In English"%></label>
                                <div>
                                    <input class="form-control" id="tabNameE-update" type="text" placeholder="<%=(lang.equals("ar")) ? "إسم القائمة باللغة الإنجليزية" : "Tab Name In English"%>" value="">
                                </div>
                            </div>
                            <div class="col-md-4">
                                <label class="col-form-label"><%=(lang.equals("ar")) ? "إسم القائمة باللغة العربية" : "Tab Name In Arabic"%></label>
                                <div>
                                    <input class="form-control" id="tabNameA-update" type="text" placeholder="<%=(lang.equals("ar")) ? "إسم القائمة باللغة العربية" : "Tab Name In Arabic"%>" value="">
                                </div>
                            </div>
                            <div class="col-md-3">
                                <label class="col-form-label"><%=(lang.equals("ar")) ? "الأيقونة" : "Icon"%></label>
                                <div style="display: flex;">
                                    <select class="form-control" onchange='changeIcon("addForm_tab_update", "iconFaFa-2-update");' id="iconFaFa-2-update" type="text" placeholder="<%=(lang.equals("ar")) ? "الأيقونة" : "Icon"%>" value="">                                                
                                        <option value='ti-home' class='ti-home'>ti-home</option>
                                        <option value='ti-book' class='ti-book'>ti-book</option>
                                        <option value='ti-email' class='ti-email'>ti-email</option>
                                        <option value='ti-calendar' class='ti-calendar'>ti-calendar</option>
                                        <option value='ti-bookmark-alt' class='ti-bookmark-alt'>ti-bookmark-alt</option>
                                        <option value='ti-comments' class='ti-comments'>ti-comments</option>
                                        <option value='ti-layout-accordion-list' class='ti-layout-accordion-list'>ti-layout-accordion-list</option>
                                        <option value='ti-user' class='ti-user'>ti-user</option>
                                    </select>
                                    <i class="icon ti-home" id="addForm_tab_update"></i>
                                </div>
                            </div>
                            <div class="col-md-3">
                                <label class="col-form-label"><%=(lang.equals("ar")) ? "الرابط" : "Link"%></label>
                                <div>
                                    <input class="form-control" id="link-tab-update" type="text" placeholder="<%=(lang.equals("ar")) ? "الرابط" : "Link"%>" value="">
                                </div>
                            </div>                            
                            <div class="col-md-3">
                                <label class="col-form-label"><%=(lang.equals("ar")) ? "الترتيب" : "index"%></label>
                                <div>
                                    <input class="form-control" id="index-tab-update" type="text" placeholder="<%=(lang.equals("ar")) ? "الترتيب" : "index"%>" value="">
                                </div>
                            </div>
                            <div class="col-md-3">
                                <label class="col-form-label"><%=(lang.equals("ar")) ? "نوع دخول الشاشة" : "Screen login type"%></label>
                                <div style="display: flex;">
                                    <select class="form-control" id="TabLockedEnch" type="text" value="">                                                
                                        <option value='00'>Disabled</option>
                                        <option value='11'>Enabled</option>
                                    </select>                                    
                                </div>
                            </div>

                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn-secondry add-item m-r5 radius-xl" data-dismiss="modal"><i class="fa fa-fw fa-close"></i> <%=(lang.equals("ar")) ? "إلغاء" : "Cancel"%></button>
                        <button type="button" onclick="update_tabs('', '', '', '', '', '', '', '', 'teacher', 'update-modal', '<%=lang%>')" class="btn" style="-webkit-border-radius: 100px;"><i class="fa fa-fw fa-edit"></i> <%=(lang.equals("ar")) ? "تعديل" : "Update"%></button>
                    </div>
                </div>
            </div>
        </div>

        <!-- Modal -->
        <div class="modal right fade  bd-example-modal-lg" id="TabsDeleteModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered modal-lg" style="max-width: 1000px;" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLongTitle"><%=(lang.equals("ar")) ? "حذف القائمة" : "Delete Tab"%></h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <div style="text-align: Center;">
                            <h1 style="color: #dc3545;"><%=(lang.equals("ar")) ? "هل أنت متأكد من عملية الحذف تلك؟" : "Are you sure of this deletion"%></h1>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn-secondry add-item m-r5 radius-xl" data-dismiss="modal"><i class="fa fa-fw fa-close"></i> <%=(lang.equals("ar")) ? "إلغاء" : "Cancel"%></button>
                        <button type="button" onclick="delete_Tabs('', '', 'teacher', 'delete-modal', '<%=lang%>')" class="btn-danger" style="-webkit-border-radius: 100px;"><i class="fa fa-fw fa-close"></i> <%=(lang.equals("ar")) ? "حذف" : "Delete"%></button>
                    </div>
                </div>
            </div>
        </div>

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
        <script src="_200_admin_admin_pages.js"></script>
        <script>
                            init('teacher', '<%=lang%>', '_205_teacher_pages');
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
%>