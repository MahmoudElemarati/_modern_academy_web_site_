<%-- 
    Document   : _003_Student_Events_News
    Created on : Mar 28, 2021, 7:14:29 PM
    Author     : cdc
--%>

<%@page import="com.modern.www._1_3_MySql_DB_daos.A0002Tabs_DAO"%>
<%@page import="com.modern.www._1_2_MySql_DB_entities.A0002Tabs"%>
<%@page import="com.modern.www._1_3_MySql_DB_daos.A0003SubTabs_DAO"%>
<%@page import="com.modern.www._1_2_MySql_DB_entities.A0003SubTabs"%>
<%@page import="java.util.List"%>
<%@page import="com.modern.www._0_3_Elemarati_pages_control._002_manage_URL"%>
<%@page import="com.modern.www._0_2_Elemarati_WebSettings._000_navbarMenu"%>
<%@page import="com.modern.www._0_3_Elemarati_pages_control._001_manage_sessions"%>
<%@page import="com.modern.www._0_3_Elemarati_pages_control._000_session_needs"%>
<%@page import="com.modern.www._0_2_Elemarati_WebSettings._010_site_constats"%>
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

            List<A0002Tabs> a0002TabsList = new A0002Tabs_DAO().GetTabsBy(current_page_accessServlet);
            A0002Tabs a0002Tabs = a0002TabsList.get(0);
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
        <title>Modern Academy : <%=(lang.equals("ar")) ? a0002Tabs.getTabNameA() : a0002Tabs.getTabNameE()%></title>

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
                                    <li><a href="javascript:;"><i class="fa fa-envelope-o"></i><%=_010_site_constats.get_site_email()%></a></li>
                                </ul>
                            </div>
                            <div class="topbar-right">
                                <ul>
                                    <li>
                                        <select class="header-lang-bx select2" id="lang" onchange="change_lang('<%=request.getContextPath()%>');">
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
                                    <li><a target="_blank" href="<%=_010_site_constats.get_site_facebook_link()%>" class="btn-link"><i class="fa fa-facebook"></i></a></li>
                                    <li><a target="_blank" href="<%=_010_site_constats.get_site_youtube_link()%> " class="btn-link"><i class="fa fa-youtube"></i></a></li>
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
                                <a href="_000_site_index_AccessServlet?lang=<%=lang%>"><img src="assets/images/logo-white.png" alt=""></a>
                            </div>
                            <!-- Mobile Nav Button ==== -->
                            <button class="navbar-toggler collapsed menuicon justify-content-end" type="button" data-toggle="collapse" data-target="#menuDropdown" aria-controls="menuDropdown" aria-expanded="false" aria-label="Toggle navigation">
                                <span></span>
                                <span></span>
                                <span></span>
                            </button>
                            <!-- Navigation Menu ==== -->
                            <div class="menu-links navbar-collapse collapse justify-content-start" id="menuDropdown">
                                <div class="menu-logo">
                                    <a href="index.html"><img src="assets/images/logo.png" alt=""></a>
                                </div>
                                <ul class="nav navbar-nav">
                                    <%
                                        String navbar = new _000_navbarMenu().getNavBar("site", lang);
                                    %>
                                    <%=navbar%>
                                </ul>
                                <div class="nav-social-link">
                                    <a href="javascript:;"><i class="fa fa-facebook"></i></a>
                                    <a href="javascript:;"><i class="fa fa-google-plus"></i></a>
                                    <a href="javascript:;"><i class="fa fa-linkedin"></i></a>
                                </div>
                            </div>
                            <!-- Navigation Menu END ==== -->
                        </div>
                    </div>
                </div>
            </header>
            <!-- header END -->
            <!-- Inner Content Box ==== -->
            <div class="page-content bg-white">
                <!-- Page Heading Box ==== -->
                <div class="page-banner ovbl-dark" style="background-image:url(assets/images/banner/banner1.jpg);">
                    <div class="container">
                        <div class="page-banner-entry">
                            <h1 class="text-white"><%=(lang.equals("ar")) ? a0002Tabs.getTabNameA() : a0002Tabs.getTabNameE()%></h1>
                        </div>
                    </div>
                </div>
                <div class="breadcrumb-row">
                    <div class="container">
                        <ul class="list-inline">
                            <li><a href="#"><%=(lang.equals("ar")) ? a0002Tabs.getA0001MainTabs().getMainTabNameA() : a0002Tabs.getA0001MainTabs().getMainTabNameE()%></a></li>
                            <li><%=(lang.equals("ar")) ? a0002Tabs.getTabNameA() : a0002Tabs.getTabNameE()%></li>
                        </ul>
                    </div>
                </div>
                <!-- Page Heading Box END ==== -->
                <!-- Page Content Box ==== -->
                <div class="content-block">
                    <!-- Blog Grid ==== -->
                    <div class="section-area section-sp1">
                        <div class="container">
                            <div class="ttr-blog-grid-3 row" id="masonry">
                                <div class="post action-card col-lg-6 col-md-6 col-sm-12 col-xs-12 m-b40">
                                    <div class="recent-news">
                                        <div class="action-box">
                                            <img src="_003_Student_Events_News/LabExam.jpg" style="height: 370px;" alt="">
                                        </div>
                                        <div class="info-bx" style="height: 525px;">
                                            <ul class="media-post">
                                                <!--<li><a href="#"><i class="fa fa-calendar"></i>Jan 02 2019</a></li>
                                                <li><a href="#"><i class="fa fa-user"></i>By William</a></li>-->
                                            </ul>
                                            <h5 class="post-title"><a href="blog-details.html">Practical Exam Tables 2020/2021 For Fall 2020</a></h5>
                                            <p>
                                            <table class="table table-striped table-bordered table-condensed lt1">                                                
                                                <tbody>
                                                    <tr>
                                                        <td>1</td>
                                                        <td>
                                                            <p>
                                                                <a target="_blank" href="_003_Student_Events_News/pdf/Communication.pdf"><span style="color: #28499c"><u>Department of Electronics and Communication Technology</u></span></a>
                                                            </p>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>2</td>
                                                        <td>
                                                            <p>
                                                                <a target="_blank" href="_003_Student_Events_News/pdf/Basic.pdf"><span style="color: #28499c"><u>Basic Sciences Department</u></span></a>
                                                            </p>
                                                        </td>
                                                    </tr>

                                                    <tr>
                                                        <td>3</td>
                                                        <td>
                                                            <p>
                                                                <a target="_blank" href="_003_Student_Events_News/pdf/SurveyingCivil.pdf"><span style="color: #28499c"><u>Surveying Practical Exam Plan - Civil Engineering Department</u></span></a>
                                                            </p>
                                                        </td>
                                                    </tr>

                                                    <tr>
                                                        <td>4</td>
                                                        <td>
                                                            <p>
                                                                <a target="_blank" href="_003_Student_Events_News/Manufacturing Engineering.jpg"><span style="color: #28499c"><u>Practical Exam Plan - Department of Manufacturing Engineering</u></span></a>
                                                            </p>
                                                        </td>
                                                    </tr>

                                                    <tr>
                                                        <td>5</td>
                                                        <td>
                                                            <p>
                                                                <a target="_blank" href="_003_Student_Events_News/pdf/comp.pdf"><span style="color: #28499c"><u>Practical Exam Plan -  Department of Computers and Information Technology</u></span></a>
                                                            </p>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>6</td>
                                                        <td>
                                                            <p>
                                                                <a target="_blank" href="_003_Student_Events_News/pdf/arcplan.pdf"><span style="color: #28499c"><u>Practical Exam Plan -  Department of Architecture Technology</u></span></a>
                                                            </p>
                                                        </td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                            </p>
                                            <div class="post-extra">
                                                <!--<a href="#" class="btn-link">READ MORE</a>-->
                                                <!--<a href="#" class="comments-bx"><i class="fa fa-comments-o"></i>20 Comment</a>-->
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="post action-card col-lg-6 col-md-6 col-sm-12 col-xs-12 m-b40">
                                    <div class="recent-news">
                                        <div class="action-box">
                                            <img src="_003_Student_Events_News/FinalExam.jpg" style="height: 370px;" alt="">
                                        </div>
                                        <div class="info-bx" style="height: 525px;">
                                            <ul class="media-post">
                                                <!--<li><a href="#"><i class="fa fa-calendar"></i>Jan 02 2019</a></li>
                                                <li><a href="#"><i class="fa fa-user"></i>By William</a></li>-->
                                            </ul>
                                            <h5 class="post-title"><a href="blog-details.html">Exam Tables For Fall 2020</a></h5>
                                            <p>
                                            <table class="table table-striped table-bordered table-condensed lt1">                                                
                                                <tbody>
                                                    <tr>
                                                        <td>1</td>
                                                        <td>
                                                            <p>
                                                                <a target="_blank" href="_003_Student_Events_News/pdf/Exams/Tablescardet.pdf"><span style="color: #28499c"><u>The combined schedule of credit hours</u></span></a>
                                                            </p>
                                                        </td>
                                                    </tr>

                                                    <tr>
                                                        <td>2</td>
                                                        <td>
                                                            <p>
                                                                <a target="_blank" href="_003_Student_Events_News/pdf/Exams/tableterm.pdf"><span style="color: #28499c"><u>Two - Semester system schedule</u></span></a>
                                                            </p>
                                                        </td>
                                                    </tr>

                                                    <tr>
                                                        <td>3</td>
                                                        <td>
                                                            <p>
                                                                <a target="_blank" href="_003_Student_Events_News/pdf/Exams/Tablesbylaw2012.pdf"><span style="color: #28499c"><u>Schedule of Fall exams By-Law 2012</u></span></a>
                                                            </p>
                                                        </td>
                                                    </tr>

                                                    <tr>
                                                        <td>4</td>
                                                        <td>
                                                            <p>
                                                                <a target="_blank" href="_003_Student_Events_News/pdf/Exams/Tablesbylaw2018.pdf"><span style="color: #28499c"><u>Schedule of Fall exams By-Law 2018</u></span></a>
                                                            </p>
                                                        </td>
                                                    </tr>

                                                    <tr>
                                                        <td>5</td>
                                                        <td>
                                                            <p>
                                                                <a target="_blank" href="_003_Student_Events_News/pdf/Exams/Tablesbylaw2020.pdf"><span style="color: #28499c"><u>Schedule of Fall exams By-Law 2020</u></span></a>
                                                            </p>
                                                        </td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                            </p>
                                            <div class="post-extra">
                                                <!--<a href="#" class="btn-link">READ MORE</a>-->
                                                <!--<a href="#" class="comments-bx"><i class="fa fa-comments-o"></i>20 Comment</a>-->
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- Pagination ==== -->
                            <!--<div class="pagination-bx rounded-sm gray clearfix">
                                <ul class="pagination">
                                    <li class="previous"><a href="#"><i class="ti-arrow-left"></i> Prev</a></li>
                                    <li class="active"><a href="#">1</a></li>
                                    <li><a href="#">2</a></li>
                                    <li><a href="#">3</a></li>
                                    <li class="next"><a href="#">Next <i class="ti-arrow-right"></i></a></li>
                                </ul>
                            </div>-->
                            <!-- Pagination END ==== -->
                        </div>
                    </div>
                    <!-- Blog Grid END ==== -->
                </div>
                <!-- Page Content Box END ==== -->
            </div>
            <!-- Page Content Box END ==== -->
            <!-- Footer ==== -->
            <footer>
                <div class="footer-top">
                    <div class="pt-exebar">
                        <div class="container">
                            <div class="d-flex align-items-stretch">
                                <div class="pt-logo mr-auto">
                                    <a href="_000_site_index_AccessServlet?lang=<%=lang%>"><img src="assets/images/logo-white.png" width="30%" alt=""/></a>
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
                                    %>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="container">
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
            <button class="back-to-top fa fa-chevron-up"></button>
        </div>
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