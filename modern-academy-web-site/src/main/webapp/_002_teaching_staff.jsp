<%-- 
    Document   : _002_teaching_staff
    Created on : Feb 20, 2021, 9:32:16 AM
    Author     : cdc
--%>

<%@page import="com.modern.www._1_3_MySql_DB_daos.A0998TeachersTypes_DAO"%>
<%@page import="com.modern.www._1_2_MySql_DB_entities.A0998TeachersTypes"%>
<%@page import="com.modern.www._1_3_MySql_DB_daos.A0995DepartmentsManagmentType_DAO"%>
<%@page import="com.modern.www._1_2_MySql_DB_entities.A0995DepartmentsManagmentType"%>
<%@page import="com.modern.www._1_2_MySql_DB_entities.A0999Teachers"%>
<%@page import="com.modern.www._1_2_MySql_DB_entities.A0996Departments"%>
<%@page import="com.modern.www._1_3_MySql_DB_daos.A0996Departments_DAO"%>
<%@page import="com.modern.www._1_3_MySql_DB_daos.A0999Teachers_DAO"%>
<%@page import="com.modern.www._1_3_MySql_DB_daos.A0003SubTabs_DAO"%>
<%@page import="com.modern.www._1_2_MySql_DB_entities.A0003SubTabs"%>
<%@page import="com.modern.www._0_2_Elemarati_WebSettings._000_navbarMenu"%>
<%@page import="com.modern.www._0_2_Elemarati_WebSettings._010_site_constats"%>
<%@page import="com.modern.www._0_3_Elemarati_pages_control._001_manage_sessions"%>
<%@page import="com.modern.www._0_3_Elemarati_pages_control._000_session_needs"%>
<%@page import="com.modern.www._1_3_MySql_DB_daos.A0002Tabs_DAO"%>
<%@page import="com.modern.www._1_2_MySql_DB_entities.A0002Tabs"%>
<%@page import="java.util.List"%>
<%@page import="com.modern.www._0_3_Elemarati_pages_control._002_manage_URL"%>
<%@page import="com.modern.www._1_1_MySql_DB_mainDao.HibernateSessionConMySql"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    HibernateSessionConMySql.MySQL_OpenCon();
    HibernateSessionConMySql.session.clear();
    try {
        String HTMLBody = (String) request.getSession().getAttribute("OpenHTMLFile");
        String lang = request.getParameter("lang");
        if (lang.equals("null")) {
            lang = "en";
        }
        if (HTMLBody.equals("Open")) {

            String current_page_accessServlet = new _002_manage_URL(request).getAccessServlet();
            // -2-get page name from DB
            List<A0003SubTabs> a0002TabsList = new A0003SubTabs_DAO().GetSubTabsBy(current_page_accessServlet);
            A0003SubTabs a0003SubTabs = a0002TabsList.get(0);
            try {
                a0003SubTabs.getA0002Tabs().getA0996Departments().getDepartmentNameA();
            } catch (Exception e) {
                throw new Exception();
            }

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
        <link rel="shortcut icon" type="image/x-icon" href="assets/images/favicon.png" />

        <!-- PAGE TITLE HERE ============================================= -->
        <title>Modern Academy : 
            <%=(lang.equals("ar")) ? a0003SubTabs.getSubTabNameA() : a0003SubTabs.getSubTabNameE()%> - 
            <%=(lang.equals("ar")) ? a0003SubTabs.getA0002Tabs().getTabNameA() : a0003SubTabs.getA0002Tabs().getTabNameE()%> </title>

        <!-- MOBILE SPECIFIC ============================================= -->
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <!--[if lt IE 9]>
        <script src="assets/js/html5shiv.min.js"></script>
        <script src="assets/js/respond.min.js"></script>
        <![endif]-->

        <!-- All PLUGINS CSS ============================================= -->
        <link rel="stylesheet" type="text/css" href="assets/css/assets.css">

        <!-- TYPOGRAPHY ============================================= -->
        <link rel="stylesheet" type="text/css" href="assets/css/typography.css">

        <!-- SHORTCODES ============================================= -->
        <link rel="stylesheet" type="text/css" href="assets/css/shortcodes/shortcodes.css">

        <!-- STYLESHEETS ============================================= -->
        <link rel="stylesheet" type="text/css" href="assets/css/style.css">
        <link class="skin" rel="stylesheet" type="text/css" href="assets/css/color/color-1.css">

    </head>
    <body id="bg">
        <div class="page-wraper">
            <div id="loading-icon-bx"></div>
            <!-- Header Top ==== -->
            <header class="header rs-nav">
                <div class="top-bar">
                    <div class="container">
                        <div class="row d-flex justify-content-between">
                            <div class="topbar-left">
                                <ul>
                                    <li><a href="faq-1.html"><i class="fa fa-question-circle"></i>Ask a Question</a></li>
                                    <li><a href="javascript:;"><i class="fa fa-envelope-o"></i>Support@website.com</a></li>
                                </ul>
                            </div>
                            <div class="topbar-right">
                                <ul>
                                    <li>
                                        <select class="header-lang-bx select2" id="lang" onchange="change_lang('<%=request.getContextPath() + "/" + current_page_accessServlet%>');">
                                            <option value="en" data-icon="flag flag-us" <%=(lang.equals("en")) ? "selected" : ""%> >English US</option>
                                            <option value="ar" data-icon="flag flag-eg" <%=(lang.equals("ar")) ? "selected" : ""%> >Arabic EGY</option>
                                        </select>
                                    </li>
                                    <%
                                        try {
                                            _000_session_needs session_needs = new _001_manage_sessions().get_Std_Admin_Session(request, lang);
                                            String user_name = session_needs.getUser_name();
                                            /*String photo = session_needs.getPhoto();
                                            String current_page_accessServlet = session_needs.getCurrent_page_accessServlet();
                                            String current_page_name = (lang.equals("ar")) ? session_needs.getCurrent_page_ar_name() : session_needs.getCurrent_page_en_name();
                                            String account_type = session_needs.getAccount_type();*/
                                    %>
                                    <li><a href="_100_account_index_AccessServlet?lang=<%=lang%>" ><%=user_name%></a></li>
                                        <%
                                        } catch (Exception e) {
                                        %>
                                    <li><a href="_001_site_login_AccessServlet?lang=<%=lang%>" ><%=(lang.equals("ar")) ? "تسجيل الدخول" : "Login"%></a></li>
                                        <%
                                            }
                                        %>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="sticky-header navbar-expand-lg">
                    <div class="menu-bar clearfix">
                        <div class="container clearfix">
                            <!-- Header Logo ==== -->
                            <div class="menu-logo">
                                <a href="index.html"><img src="assets/images/logo.png" alt=""></a>
                            </div>
                            <!-- Mobile Nav Button ==== -->
                            <button class="navbar-toggler collapsed menuicon justify-content-end" type="button" data-toggle="collapse" data-target="#menuDropdown" aria-controls="menuDropdown" aria-expanded="false" aria-label="Toggle navigation">
                                <span></span>
                                <span></span>
                                <span></span>
                            </button>
                            <!-- Author Nav ==== -->
                            <div class="secondary-menu">
                                <div class="secondary-inner">
                                    <ul>
                                        <li><a target="_blank" href="<%=_010_site_constats.get_site_facebook_link()%>" class="btn-link"><i class="fa fa-facebook"></i></a></li>
                                        <li><a target="_blank" href="<%=_010_site_constats.get_site_youtube_link()%> " class="btn-link"><i class="fa fa-youtube"></i></a></li>                                        
                                    </ul>
                                </div>
                            </div>
                            <!-- Navigation Menu ==== -->
                            <div class="menu-links navbar-collapse collapse justify-content-start" id="menuDropdown">
                                <div class="menu-logo">
                                    <a href="_000_site_index_AccessServlet?lang=<%=lang%>"><img src="assets/images/logo-white.png" alt=""></a>
                                </div>
                                <ul class="nav navbar-nav"><%
                                    String navbar = new _000_navbarMenu().getNavBar("site", lang);
                                    %>
                                    <%=navbar%>
                                </ul>
                            </div>
                            <!-- Navigation Menu END ==== -->
                        </div>
                    </div>
                </div>
            </header>
            <!-- header END ==== -->
            <!-- Content -->
            <div class="page-content bg-white">
                <!-- inner page banner -->
                <div class="page-banner ovbl-dark" style="background-image:url(assets/images/banner/banner1.jpg);">
                    <div class="container">
                        <div class="page-banner-entry">
                            <h1 class="text-white"><%=(lang.equals("ar")) ? a0003SubTabs.getSubTabNameA() : a0003SubTabs.getSubTabNameE()%> - <%=(lang.equals("ar")) ? a0003SubTabs.getA0002Tabs().getTabNameA() : a0003SubTabs.getA0002Tabs().getTabNameE()%></h1>
                        </div>
                    </div>
                </div>
                <!-- Breadcrumb row -->
                <div class="breadcrumb-row">
                    <div class="container">
                        <ul class="list-inline">

                            <li><a href="#"><%=(lang.equals("ar")) ? a0003SubTabs.getA0002Tabs().getA0001MainTabs().getMainTabNameA() : a0003SubTabs.getA0002Tabs().getA0001MainTabs().getMainTabNameE()%></a></li>
                            <li><%=(lang.equals("ar")) ? a0003SubTabs.getA0002Tabs().getTabNameA() : a0003SubTabs.getA0002Tabs().getTabNameE()%></li>
                            <li><%=(lang.equals("ar")) ? a0003SubTabs.getSubTabNameA() : a0003SubTabs.getSubTabNameE()%></li>
                        </ul>
                    </div>
                </div>
                <!-- Breadcrumb row END -->
                <!-- contact area -->
                <div class="content-block">
                    <!-- Portfolio  -->
                    <div class="section-area section-sp1 gallery-bx">
                        <div class="container">
                            <div class="feature-filters clearfix center m-b40">
                                <ul class="filters" data-toggle="buttons">
                                    <li data-filter="" class="btn active">
                                        <input type="radio">
                                        <a href="#"><span><%=(lang.equals("ar")) ? "الكل" : "All"%></span></a> 
                                    </li>

                                    <li data-filter="mangers" class="btn">
                                        <input type="radio">
                                        <a href="#"><span><%=(lang.equals("ar")) ? "الرئيس ونائب الرئيس" : "Head & ViceHead"%></span></a> 
                                    </li>


                                    <%
                                        List<A0998TeachersTypes> a0998TeachersTypesList = new A0998TeachersTypes_DAO().GetTeacherTypes();
                                        for (A0998TeachersTypes a0998TeachersTypes : a0998TeachersTypesList) {
                                    %>
                                    <li data-filter="<%=a0998TeachersTypes.getTeacherTypeNameE()%>" class="btn">
                                        <input type="radio">
                                        <a href="#"><span><%=(lang.equals("ar")) ? a0998TeachersTypes.getTeacherTypeNameA() : a0998TeachersTypes.getTeacherTypeNameE()%></span></a> 
                                    </li>
                                    <%
                                        }
                                    %>

                                </ul>
                            </div>
                            <div class="clearfix">
                                <ul id="masonry" class="ttr-gallery-listing magnific-image row">

                                    <!------------------------------------------- Head ----------------------------->
                                    <%
                                        A0999Teachers_DAO a0999Teachers_DAO = new A0999Teachers_DAO();

                                        //GET teachers Head Of department
                                        List<A0996Departments> dList = new A0996Departments_DAO().GetDepartmentsById("" + a0003SubTabs.getA0002Tabs().getA0996Departments().getDepartmentId());
                                        if (!dList.isEmpty()) {
                                            A0996Departments a0996Departments = dList.get(0);
                                            String Head_id = "" + a0996Departments.getA0999TeachersByHeadId().getTeacherId();
                                            String Vice_id = "" + a0996Departments.getA0999TeachersByViceHeadId().getTeacherId();

                                            try {
                                                List<A0999Teachers> teachList = a0999Teachers_DAO.GetTeacherByiD(Head_id);
                                                A0999Teachers a0999Teachers = teachList.get(0);
                                                String photo = (a0999Teachers.getTeacherPhoto() == null || a0999Teachers.getTeacherPhoto().isEmpty()) ? "admin/assets/images/user.png" : "data:image/jpeg;base64," + a0999Teachers.getTeacherPhoto();

                                                // Position Data
                                                List<A0995DepartmentsManagmentType> dmtList = new A0995DepartmentsManagmentType_DAO().GetDepartmentsManagmentTypeByID("1");// Head
                                                String position = "";
                                                if (!dmtList.isEmpty()) {
                                                    A0995DepartmentsManagmentType dmt = dmtList.get(0);
                                                    position = (lang.equals("ar")) ? dmt.getManagementNameA() + " - " + a0999Teachers.getA0996Departments().getDepartmentNameA()
                                                            : dmt.getManagementNameE() + " - " + a0999Teachers.getA0996Departments().getDepartmentNameE();
                                                }
                                    %>
                                    <li class="action-card col-lg-3 col-md-4 col-sm-6 mangers">
                                        <div class="ttr-box portfolio-bx">
                                            <div class="ttr-media media-ov2 media-effect">
                                                <a href="javascript:void(0);">
                                                    <img src="<%=photo%>" alt=""> 
                                                </a>
                                                <div class="ov-box">
                                                    <div class="overlay-icon align-m"> 
                                                        <a href="<%=photo%>" class="magnific-anchor" title="Title Come Here">
                                                            <i class="ti-search"></i>
                                                        </a>
                                                    </div>
                                                    <div class="portfolio-info-bx bg-primary">
                                                        <h4><a href="#"><%=(lang.equals("ar")) ? a0999Teachers.getTeacherNameA() : a0999Teachers.getTeacherNameE()%></a></h4>
                                                        <h4><a href="#"><%=position%></a></h4>

                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </li>
                                    <%
                                        } catch (Exception headEx) {

                                        }
                                    %>



                                    <!------------------------------------------- Vice ----------------------------->
                                    <%
                                        //                                        
                                        try {
                                            List<A0999Teachers> teachList = a0999Teachers_DAO.GetTeacherByiD(Vice_id);
                                            A0999Teachers a0999Teachers = teachList.get(0);
                                            String photo = (a0999Teachers.getTeacherPhoto() == null || a0999Teachers.getTeacherPhoto().isEmpty()) ? "admin/assets/images/user.png" : "data:image/jpeg;base64," + a0999Teachers.getTeacherPhoto();

                                            // Position Data
                                            List<A0995DepartmentsManagmentType> dmtList = new A0995DepartmentsManagmentType_DAO().GetDepartmentsManagmentTypeByID("2");// Vice Head
                                            String position = "";
                                            if (!dmtList.isEmpty()) {
                                                A0995DepartmentsManagmentType dmt = dmtList.get(0);
                                                position = (lang.equals("ar")) ? dmt.getManagementNameA() + " - " + a0999Teachers.getA0996Departments().getDepartmentNameA()
                                                        : dmt.getManagementNameE() + " - " + a0999Teachers.getA0996Departments().getDepartmentNameE();
                                            }
                                    %>
                                    <li class="action-card col-lg-3 col-md-4 col-sm-6 mangers">
                                        <div class="ttr-box portfolio-bx">
                                            <div class="ttr-media media-ov2 media-effect">
                                                <a href="javascript:void(0);">
                                                    <img src="<%=photo%>" alt=""> 
                                                </a>
                                                <div class="ov-box">
                                                    <div class="overlay-icon align-m"> 
                                                        <a href="<%=photo%>" class="magnific-anchor" title="Title Come Here">
                                                            <i class="ti-search"></i>
                                                        </a>
                                                    </div>
                                                    <div class="portfolio-info-bx bg-primary">
                                                        <h4><a href="#"><%=(lang.equals("ar")) ? a0999Teachers.getTeacherNameA() : a0999Teachers.getTeacherNameE()%></a></h4>
                                                        <h4><a href="#"><%=position%></a></h4>

                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </li>
                                    <%
                                        } catch (Exception viceEx) {

                                        }

                                    %>


                                    <!------------------------------------------- Teacher Without Managers ----------------------------->
                                    <!------------------------------------------- Teacher Without Managers ----------------------------->
                                    <!------------------------------------------- Teacher Without Managers ----------------------------->
                                    <!------------------------------------------- Teacher Without Managers ----------------------------->

                                    <!------------------------------------------- Prof Teachers ----------------------------->
                                    <%   //
                                        List<A0999Teachers> teachList = a0999Teachers_DAO.GetTypedTeachersExceptHeadAndVice(Head_id, Vice_id, "1");
                                        for (A0999Teachers a0999Teachers : teachList) {
                                            String photo = (a0999Teachers.getTeacherPhoto() == null || a0999Teachers.getTeacherPhoto().isEmpty()) ? "admin/assets/images/user.png" : "data:image/jpeg;base64," + a0999Teachers.getTeacherPhoto();

                                            // Position Data
                                            List<A0995DepartmentsManagmentType> dmtList = new A0995DepartmentsManagmentType_DAO().GetDepartmentsManagmentTypeByID("2");// Vice Head
                                            String position = "";
                                            if (!dmtList.isEmpty()) {
                                                A0995DepartmentsManagmentType dmt = dmtList.get(0);
                                                position = (lang.equals("ar")) ? dmt.getManagementNameA() + " - " + a0999Teachers.getA0996Departments().getDepartmentNameA()
                                                        : dmt.getManagementNameE() + " - " + a0999Teachers.getA0996Departments().getDepartmentNameE();
                                            }
                                    %>

                                    <li class="action-card col-lg-3 col-md-4 col-sm-6 <%=a0999Teachers.getA0998TeachersTypes().getTeacherTypeNameE()%>">
                                        <div class="ttr-box portfolio-bx">
                                            <div class="ttr-media media-ov2 media-effect">
                                                <a href="javascript:void(0);">
                                                    <img src="<%=photo%>" alt=""> 
                                                </a>
                                                <div class="ov-box">
                                                    <div class="overlay-icon align-m"> 
                                                        <a href="<%=photo%>" class="magnific-anchor" title="Title Come Here">
                                                            <i class="ti-search"></i>
                                                        </a>
                                                    </div>
                                                    <div class="portfolio-info-bx bg-primary">
                                                        <h4><a href="#"><%=(lang.equals("ar")) ? a0999Teachers.getTeacherNameA() : a0999Teachers.getTeacherNameE()%></a></h4>

                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </li>
                                    <%
                                        }
                                    %>


                                    <!------------------------------------------- Doctor Teachers ----------------------------->
                                    <%   //
                                        teachList = a0999Teachers_DAO.GetTypedTeachersExceptHeadAndVice(Head_id, Vice_id, "2");
                                        for (A0999Teachers a0999Teachers : teachList) {
                                            String photo = (a0999Teachers.getTeacherPhoto() == null || a0999Teachers.getTeacherPhoto().isEmpty()) ? "admin/assets/images/user.png" : "data:image/jpeg;base64," + a0999Teachers.getTeacherPhoto();

                                            // Position Data
                                            List<A0995DepartmentsManagmentType> dmtList = new A0995DepartmentsManagmentType_DAO().GetDepartmentsManagmentTypeByID("2");// Vice Head
                                            String position = "";
                                            if (!dmtList.isEmpty()) {
                                                A0995DepartmentsManagmentType dmt = dmtList.get(0);
                                                position = (lang.equals("ar")) ? dmt.getManagementNameA() + " - " + a0999Teachers.getA0996Departments().getDepartmentNameA()
                                                        : dmt.getManagementNameE() + " - " + a0999Teachers.getA0996Departments().getDepartmentNameE();
                                            }
                                    %>

                                    <li class="action-card col-lg-3 col-md-4 col-sm-6 <%=a0999Teachers.getA0998TeachersTypes().getTeacherTypeNameE()%>">
                                        <div class="ttr-box portfolio-bx">
                                            <div class="ttr-media media-ov2 media-effect">
                                                <a href="javascript:void(0);">
                                                    <img src="<%=photo%>" alt=""> 
                                                </a>
                                                <div class="ov-box">
                                                    <div class="overlay-icon align-m"> 
                                                        <a href="<%=photo%>" class="magnific-anchor" title="Title Come Here">
                                                            <i class="ti-search"></i>
                                                        </a>
                                                    </div>
                                                    <div class="portfolio-info-bx bg-primary">
                                                        <h4><a href="#"><%=(lang.equals("ar")) ? a0999Teachers.getTeacherNameA() : a0999Teachers.getTeacherNameE()%></a></h4>

                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </li>
                                    <%
                                        }
                                    %>

                                    <!------------------------------------------- Teacher Assistance ----------------------------->
                                    <%   //
                                        teachList = a0999Teachers_DAO.GetTypedTeachersExceptHeadAndVice(Head_id, Vice_id, "3");
                                        for (A0999Teachers a0999Teachers : teachList) {
                                            String photo = (a0999Teachers.getTeacherPhoto() == null || a0999Teachers.getTeacherPhoto().isEmpty()) ? "admin/assets/images/user.png" : "data:image/jpeg;base64," + a0999Teachers.getTeacherPhoto();

                                            // Position Data
                                            List<A0995DepartmentsManagmentType> dmtList = new A0995DepartmentsManagmentType_DAO().GetDepartmentsManagmentTypeByID("2");// Vice Head
                                            String position = "";
                                            if (!dmtList.isEmpty()) {
                                                A0995DepartmentsManagmentType dmt = dmtList.get(0);
                                                position = (lang.equals("ar")) ? dmt.getManagementNameA() + " - " + a0999Teachers.getA0996Departments().getDepartmentNameA()
                                                        : dmt.getManagementNameE() + " - " + a0999Teachers.getA0996Departments().getDepartmentNameE();
                                            }
                                    %>

                                    <li class="action-card col-lg-3 col-md-4 col-sm-6 <%=a0999Teachers.getA0998TeachersTypes().getTeacherTypeNameE()%>">
                                        <div class="ttr-box portfolio-bx">
                                            <div class="ttr-media media-ov2 media-effect">
                                                <a href="javascript:void(0);">
                                                    <img src="<%=photo%>" alt=""> 
                                                </a>
                                                <div class="ov-box">
                                                    <div class="overlay-icon align-m"> 
                                                        <a href="<%=photo%>" class="magnific-anchor" title="Title Come Here">
                                                            <i class="ti-search"></i>
                                                        </a>
                                                    </div>
                                                    <div class="portfolio-info-bx bg-primary">
                                                        <h4><a href="#"><%=(lang.equals("ar")) ? a0999Teachers.getTeacherNameA() : a0999Teachers.getTeacherNameE()%></a></h4>

                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </li>
                                    <%
                                        }
                                    %>



                                    <!------------------------------------------- Teacher ----------------------------->
                                    <%   //
                                        teachList = a0999Teachers_DAO.GetTypedTeachersExceptHeadAndVice(Head_id, Vice_id, "4");
                                        for (A0999Teachers a0999Teachers : teachList) {
                                            String photo = (a0999Teachers.getTeacherPhoto() == null || a0999Teachers.getTeacherPhoto().isEmpty()) ? "admin/assets/images/user.png" : "data:image/jpeg;base64," + a0999Teachers.getTeacherPhoto();

                                            // Position Data
                                            List<A0995DepartmentsManagmentType> dmtList = new A0995DepartmentsManagmentType_DAO().GetDepartmentsManagmentTypeByID("2");// Vice Head                                            
                                    %>

                                    <li class="action-card col-lg-3 col-md-4 col-sm-6 <%=a0999Teachers.getA0998TeachersTypes().getTeacherTypeNameE()%>">
                                        <div class="ttr-box portfolio-bx">
                                            <div class="ttr-media media-ov2 media-effect">
                                                <a href="javascript:void(0);">
                                                    <img src="<%=photo%>" alt=""> 
                                                </a>
                                                <div class="ov-box">
                                                    <div class="overlay-icon align-m"> 
                                                        <a href="<%=photo%>" class="magnific-anchor" title="Title Come Here">
                                                            <i class="ti-search"></i>
                                                        </a>
                                                    </div>
                                                    <div class="portfolio-info-bx bg-primary">
                                                        <h4><a href="#"><%=(lang.equals("ar")) ? a0999Teachers.getTeacherNameA() : a0999Teachers.getTeacherNameE()%></a></h4>

                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </li>
                                    <%
                                        }
                                    %>





                                    <%//
                                        }
                                    %>


                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- contact area END -->
            </div>
            <!-- Content END-->
            <!-- Footer ==== -->
            <footer>
                <div class="footer-top">
                    <div class="pt-exebar">
                        <div class="container">
                            <div class="d-flex align-items-stretch">
                                <div class="pt-logo mr-auto">
                                    <a href="index.html"><img src="assets/images/logo-white.png" width="30%" alt=""/></a>
                                </div>
                                <div class="pt-social-link">
                                    <ul class="list-inline m-a0">
                                        <li><a target="_blank" href="<%=_010_site_constats.get_site_facebook_link()%>" class="btn-link"><i class="fa fa-facebook"></i></a></li>
                                        <li><a target="_blank" href="<%=_010_site_constats.get_site_youtube_link()%>" class="btn-link"><i class="fa fa-youtube"></i></a></li>
                                    </ul>
                                </div>
                                <div class="pt-btn-join">
                                    <%
                                        try {
                                            _000_session_needs session_needs = new _001_manage_sessions().get_Std_Admin_Session(request, lang);
                                            String user_name = session_needs.getUser_name();
                                            /*String photo = session_needs.getPhoto();
                                                                                String current_page_accessServlet = session_needs.getCurrent_page_accessServlet();
                                                                                String current_page_name = (lang.equals("ar")) ? session_needs.getCurrent_page_ar_name() : session_needs.getCurrent_page_en_name();
                                                                                String account_type = session_needs.getAccount_type();*/
                                    %>
                                    <a href="_100_account_index_AccessServlet?lang=<%=lang%>" class="btn "><%=user_name%></a>
                                    <%
                                    } catch (Exception e) {
                                    %>
                                    <a href="_001_site_login_AccessServlet?lang=<%=lang%>" class="btn "><%=(lang.equals("ar")) ? "تسجيل الدخول" : "Login"%></a>
                                    <%
                                        }
                                    %>                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="container">
                        <div class="row">
                            <div class="col-12 col-lg-7 col-md-7 col-sm-12">
                                <div class="row">

                                    <div class="col-7 col-lg-7 col-md-7 col-sm-7">
                                        <div class="widget footer_widget">
                                            <%                                                //
                                                if (lang.equals("ar")) {
                                            %> 
                                            <h5 class="footer-title">شهادات البكالوريوس في</h5>
                                            <ul>
                                                <li><a>هندسة الكمبيوتر وتكنولوجيا المعلومات</a></li>
                                                <li><a>هندسة الإلكترونيات والاتصالات</a></li>
                                                <li><a>هندسة التصنيع</a></li>
                                                <li><a>الهندسة المعمارية</a></li>
                                                <li><a>هندسة مدنية</a></li>
                                            </ul>
                                            <%
                                            } else {
                                            %> 
                                            <h5 class="footer-title">Bachelor's degree Certificates In</h5>
                                            <ul>
                                                <li><a>Computer Engineering & Information Technology</a></li>
                                                <li><a>Electronics & Communications Engineering</a></li>
                                                <li><a>Manufacturing Engineering</a></li>
                                                <li><a>Architectural Engineering</a></li>
                                                <li><a>Civil Engineering</a></li>
                                            </ul>
                                            <%
                                                }
                                            %>
                                        </div>
                                    </div>

                                    <div class="col-5 col-lg-5 col-md-5 col-sm-5">
                                        <div class="widget footer_widget">
                                            <%                                                //
                                                if (lang.equals("ar")) {
                                            %>                                            
                                            <h5 class="footer-title">الأقسام</h5>                                            
                                            <ul>
                                                <li><a>الحاسبات</a></li>
                                                <li><a>الإتصالات</a></li>
                                                <li><a>تصنيع</a></li>
                                                <li><a>عمارة</a></li>
                                                <li><a>مدني</a></li>
                                                <li><a>علوم أساسية</a></li>
                                            </ul>
                                            <%
                                            } else {
                                            %>                                            
                                            <h5 class="footer-title">Departments</h5>                                            
                                            <ul>
                                                <li><a>Computer</a></li>
                                                <li><a>Communications</a></li>
                                                <li><a>Manufacturing</a></li>
                                                <li><a>Architecture</a></li>
                                                <li><a>Civil</a></li>
                                                <li><a>Basic Engineering Science</a></li>
                                            </ul>
                                            <%
                                                }
                                            %>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-12 col-lg-5 col-md-5 col-sm-12 footer-col-4">
                                <div class="widget widget_gallery gallery-grid-4">
                                    <ul class="magnific-image">
                                        <li><a href="assets/images/gallery/pic1.jpg" class="magnific-anchor"><img src="assets/images/gallery/pic1.jpg" alt=""></a></li>
                                        <li><a href="assets/images/gallery/pic2.jpg" class="magnific-anchor"><img src="assets/images/gallery/pic2.jpg" alt=""></a></li>
                                        <li><a href="assets/images/gallery/pic3.jpg" class="magnific-anchor"><img src="assets/images/gallery/pic3.jpg" alt=""></a></li>
                                        <li><a href="assets/images/gallery/pic4.jpg" class="magnific-anchor"><img src="assets/images/gallery/pic4.jpg" alt=""></a></li>
                                        <li><a href="assets/images/gallery/pic5.jpg" class="magnific-anchor"><img src="assets/images/gallery/pic5.jpg" alt=""></a></li>
                                        <li><a href="assets/images/gallery/pic6.jpg" class="magnific-anchor"><img src="assets/images/gallery/pic6.jpg" alt=""></a></li>
                                        <li><a href="assets/images/gallery/pic7.jpg" class="magnific-anchor"><img src="assets/images/gallery/pic7.jpg" alt=""></a></li>
                                        <li><a href="assets/images/gallery/pic8.jpg" class="magnific-anchor"><img src="assets/images/gallery/pic8.jpg" alt=""></a></li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="footer-bottom">
                    <div class="container">
                        <div class="row">
                            <div class="col-lg-12 col-md-12 col-sm-12 text-center"><a target="_blank" href="javascript:;">Computer Department</a></div>
                        </div>
                    </div>
                </div>
            </footer>
            <!-- Footer END ==== -->
            <button class="back-to-top fa fa-chevron-up" ></button>
        </div>
        <!-- Language JavaScript -->
        <script>var lang = '<%=lang%>';</script>
        <!-- External JavaScripts -->
        <script src="assets/js/jquery.min.js"></script>
        <script src="assets/vendors/bootstrap/js/popper.min.js"></script>
        <script src="assets/vendors/bootstrap/js/bootstrap.min.js"></script>
        <script src="assets/vendors/bootstrap-select/bootstrap-select.min.js"></script>
        <script src="assets/vendors/bootstrap-touchspin/jquery.bootstrap-touchspin.js"></script>
        <script src="assets/vendors/magnific-popup/magnific-popup.js"></script>
        <script src="assets/vendors/counter/waypoints-min.js"></script>
        <script src="assets/vendors/counter/counterup.min.js"></script>
        <script src="assets/vendors/imagesloaded/imagesloaded.js"></script>
        <script src="assets/vendors/masonry/masonry.js"></script>
        <script src="assets/vendors/masonry/filter.js"></script>
        <script src="assets/vendors/owl-carousel/owl.carousel.js"></script>
        <script src="assets/js/functions.js"></script>
        <script src="assets/js/contact.js"></script>
        <script src="_000_lang.js"></script>
    </body>

</html>


<%
        } else { // InValid Access To the Page Exception
            response.sendRedirect("_999_error-404.html");
        }
    } catch (Exception e) {
        e.printStackTrace();
        response.sendRedirect("_999_error-404.html");
    }
    HibernateSessionConMySql.session.clear();
%>
