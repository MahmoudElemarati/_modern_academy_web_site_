<%-- 
    Document   : _000_web_index
    Created on : Jan 26, 2021, 5:08:43 PM
    Author     : Mahmoud
--%>

<%@page import="com.modern.www._0_3_Elemarati_pages_control._001_manage_sessions"%>
<%@page import="com.modern.www._0_3_Elemarati_pages_control._000_session_needs"%>
<%@page import="com.modern.www._1_1_MySql_DB_mainDao.HibernateSessionConMySql"%>
<%@page import="com.modern.www._0_2_Elemarati_WebSettings._010_site_constats"%>
<%@page import="com.modern.www._0_2_Elemarati_WebSettings._000_navbarMenu"%>
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
        <title>Modern Academy : For Engineering & Technology </title>

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

        <!-- REVOLUTION SLIDER CSS ============================================= -->
        <link rel="stylesheet" type="text/css" href="assets/vendors/revolution/css/layers.css">
        <link rel="stylesheet" type="text/css" href="assets/vendors/revolution/css/settings.css">
        <link rel="stylesheet" type="text/css" href="assets/vendors/revolution/css/navigation.css">
        <!-- REVOLUTION SLIDER END -->	
    </head>
    <body id="bg">
        <div class="page-wraper">
            <div id="loading-icon-bx"></div>
            <!-- Header Top ==== -->
            <header class="header rs-nav header-transparent">
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
                                    <a href="_000_site_index_AccessServlet?lang=<%=lang%>"><img src="assets/images/logo-white.png" alt=""></a>
                                </div>
                                <ul class="nav navbar-nav">	
                                    <%
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
            <!-- Header Top END ==== -->
            <!-- Content -->
            <div class="page-content bg-white">
                <!-- Main Slider -->
                <div class="rev-slider">
                    <div id="rev_slider_486_1_wrapper" class="rev_slider_wrapper fullwidthbanner-container" data-alias="news-gallery36" data-source="gallery" style="margin:0px auto;background-color:#ffffff;padding:0px;margin-top:0px;margin-bottom:0px;">
                        <!-- START REVOLUTION SLIDER 5.3.0.2 fullwidth mode -->
                        <div id="rev_slider_486_1" class="rev_slider fullwidthabanner" style="display:none;" data-version="5.3.0.2">
                            <ul>	<!-- SLIDE  -->
                                <li data-index="rs-100" 
                                    data-transition="parallaxvertical" 
                                    data-slotamount="default" 
                                    data-hideafterloop="0" 
                                    data-hideslideonmobile="off" 
                                    data-easein="default" 
                                    data-easeout="default" 
                                    data-masterspeed="default" 
                                    data-thumb="error-404.html" 
                                    data-rotate="0" 
                                    data-fstransition="fade" 
                                    data-fsmasterspeed="1500" 
                                    data-fsslotamount="7" 
                                    data-saveperformance="off" 
                                    data-title="A STUDY ON HAPPINESS" 
                                    data-param1="" data-param2="" 
                                    data-param3="" data-param4="" 
                                    data-param5="" data-param6="" 
                                    data-param7="" data-param8="" 
                                    data-param9="" data-param10="" 
                                    data-description="Science says that Women are generally happier">
                                    <!-- MAIN IMAGE -->
                                    <img src="assets/images/slider/slide1_temp.jpg" alt="" 
                                         data-bgposition="center center" 
                                         data-bgfit="cover" 
                                         data-bgrepeat="no-repeat" 
                                         data-bgparallax="10" 
                                         class="rev-slidebg" 
                                         data-no-retina />

                                    <!-- LAYER NR. 1 -->
                                    <div class="tp-caption tp-shape tp-shapewrapper " 
                                         id="slide-100-layer-1" 
                                         data-x="['center','center','center','center']" data-hoffset="['0','0','0','0']" 
                                         data-y="['middle','middle','middle','middle']" data-voffset="['0','0','0','0']" 
                                         data-width="full"
                                         data-height="full"
                                         data-whitespace="nowrap"
                                         data-type="shape" 
                                         data-basealign="slide" 
                                         data-responsive_offset="off" 
                                         data-responsive="off"
                                         data-frames='[{"from":"opacity:0;","speed":1,"to":"o:1;","delay":0,"ease":"Power4.easeOut"},{"delay":"wait","speed":1,"to":"opacity:0;","ease":"Power4.easeOut"}]'
                                         data-textAlign="['left','left','left','left']"
                                         data-paddingtop="[0,0,0,0]"
                                         data-paddingright="[0,0,0,0]"
                                         data-paddingbottom="[0,0,0,0]"
                                         data-paddingleft="[0,0,0,0]"
                                         style="z-index: 5;background-color:rgba(2, 0, 11, 0.80);border-color:rgba(0, 0, 0, 0);border-width:0px;"> </div>	
                                    <!-- LAYER NR. 2 -->
                                    <div class="tp-caption Newspaper-Title   tp-resizeme" 
                                         id="slide-100-layer-2" 
                                         data-x="['center','center','center','center']" 
                                         data-hoffset="['0','0','0','0']" 
                                         data-y="['top','top','top','top']" 
                                         data-voffset="['250','250','250','240']" 
                                         data-fontsize="['50','50','50','30']"
                                         data-lineheight="['55','55','55','35']"
                                         data-width="full"
                                         data-height="none"
                                         data-whitespace="normal"
                                         data-type="text" 
                                         data-responsive_offset="on" 
                                         data-frames='[{"from":"y:[-100%];z:0;rX:0deg;rY:0;rZ:0;sX:1;sY:1;skX:0;skY:0;","mask":"x:0px;y:0px;s:inherit;e:inherit;","speed":1500,"to":"o:1;","delay":1000,"ease":"Power3.easeInOut"},{"delay":"wait","speed":1000,"to":"auto:auto;","mask":"x:0;y:0;s:inherit;e:inherit;","ease":"Power3.easeInOut"}]'
                                         data-textAlign="['center','center','center','center']"
                                         data-paddingtop="[0,0,0,0]"
                                         data-paddingright="[0,0,0,0]"
                                         data-paddingbottom="[10,10,10,10]"
                                         data-paddingleft="[0,0,0,0]"
                                         style="z-index: 6; font-family:rubik; font-weight:700; text-align:center; white-space: normal;">
                                        <%
                                            if (lang.equals("ar")) {
                                        %>
                                        مرحبا بكم في مودرن أكاديمي
                                        <%
                                        } else {
                                        %>
                                        Welcome To Modern Academy                                        
                                        <%
                                            }
                                        %>
                                    </div>

                                    <!-- LAYER NR. 3 -->
                                    <div class="tp-caption Newspaper-Subtitle   tp-resizeme" 
                                         id="slide-100-layer-3" 
                                         data-x="['center','center','center','center']" 
                                         data-hoffset="['0','0','0','0']" 
                                         data-y="['top','top','top','top']" 
                                         data-voffset="['210','210','210','210']" 
                                         data-width="none"
                                         data-height="none"
                                         data-whitespace="nowrap"
                                         data-type="text" 
                                         data-responsive_offset="on"
                                         data-frames='[{"from":"y:[-100%];z:0;rX:0deg;rY:0;rZ:0;sX:1;sY:1;skX:0;skY:0;","mask":"x:0px;y:0px;s:inherit;e:inherit;","speed":1500,"to":"o:1;","delay":1000,"ease":"Power3.easeInOut"},{"delay":"wait","speed":1000,"to":"auto:auto;","mask":"x:0;y:0;s:inherit;e:inherit;","ease":"Power3.easeInOut"}]'
                                         data-textAlign="['left','left','left','left']"
                                         data-paddingtop="[0,0,0,0]"
                                         data-paddingright="[0,0,0,0]"
                                         data-paddingbottom="[0,0,0,0]"
                                         data-paddingleft="[0,0,0,0]"
                                         style="z-index: 7; white-space: nowrap; color:#fff; font-family:rubik; font-size:18px; font-weight:400;">
                                        <%
                                            if (lang.equals("ar")) {
                                        %>
                                        تعليم أفضل لمستقبل أفضل
                                        <%
                                        } else {
                                        %>                                        
                                        Better Education For A Better Future
                                        <%
                                            }
                                        %>
                                    </div>

                                    <!-- LAYER NR. 4 -->
                                    <div class="tp-caption Newspaper-Button rev-btn " 
                                         id="slide-100-layer-5" 
                                         data-x="['center','center','center','center']" 
                                         data-hoffset="['90','80','75','90']" 
                                         data-y="['top','top','top','top']" 
                                         data-voffset="['400','400','400','420']" 
                                         data-width="none"
                                         data-height="none"
                                         data-whitespace="nowrap"
                                         data-type="button" 
                                         data-responsive_offset="on" 
                                         data-responsive="off"
                                         data-frames='[{"from":"y:[-100%];z:0;rX:0deg;rY:0;rZ:0;sX:1;sY:1;skX:0;skY:0;","mask":"x:0px;y:0px;","speed":1500,"to":"o:1;","delay":1000,"ease":"Power3.easeInOut"},{"delay":"wait","speed":1000,"to":"auto:auto;","mask":"x:0;y:0;","ease":"Power3.easeInOut"},{"frame":"hover","speed":"300","ease":"Power1.easeInOut","to":"o:1;rX:0;rY:0;rZ:0;z:0;","style":"c:rgba(0, 0, 0, 1.00);bg:rgba(255, 255, 255, 1.00);bc:rgba(255, 255, 255, 1.00);bw:1px 1px 1px 1px;"}]'
                                         data-textAlign="['center','center','center','center']"
                                         data-paddingtop="[12,12,12,12]"
                                         data-paddingright="[30,35,35,15]"
                                         data-paddingbottom="[12,12,12,12]"
                                         data-paddingleft="[30,35,35,15]"
                                         style="z-index: 8;white-space: nowrap; outline:none;box-shadow:none;box-sizing:border-box;-moz-box-sizing:border-box;-webkit-box-sizing:border-box;cursor:pointer; background-color:var(--primary) !important; border:0; border-radius:30px; margin-right:5px;"><%=(lang.equals("ar")) ? "اقرأ المزيد" : "READ MORE"%></div>
                                    <div class="tp-caption Newspaper-Button rev-btn" 
                                         id="slide-100-layer-6" 
                                         data-x="['center','center','center','center']" 
                                         data-hoffset="['-90','-80','-75','-90']" 
                                         data-y="['top','top','top','top']" 
                                         data-voffset="['400','400','400','420']" 
                                         data-width="none"
                                         data-height="none"
                                         data-whitespace="nowrap"
                                         data-type="button" 
                                         data-responsive_offset="on" 
                                         data-responsive="off"
                                         data-frames='[{"from":"y:[-100%];z:0;rX:0deg;rY:0;rZ:0;sX:1;sY:1;skX:0;skY:0;","mask":"x:0px;y:0px;","speed":1500,"to":"o:1;","delay":1000,"ease":"Power3.easeInOut"},{"delay":"wait","speed":1000,"to":"auto:auto;","mask":"x:0;y:0;","ease":"Power3.easeInOut"},{"frame":"hover","speed":"300","ease":"Power1.easeInOut","to":"o:1;rX:0;rY:0;rZ:0;z:0;","style":"c:rgba(0, 0, 0, 1.00);bg:rgba(255, 255, 255, 1.00);bc:rgba(255, 255, 255, 1.00);bw:1px 1px 1px 1px;"}]'
                                         data-textAlign="['center','center','center','center']"
                                         data-paddingtop="[12,12,12,12]"
                                         data-paddingright="[30,35,35,15]"
                                         data-paddingbottom="[12,12,12,12]"
                                         data-paddingleft="[30,35,35,15]"
                                         style="z-index: 8; white-space: nowrap; outline:none;box-shadow:none;box-sizing:border-box;-moz-box-sizing:border-box;-webkit-box-sizing:border-box;cursor:pointer; border-radius:30px;"><%=(lang.equals("ar")) ? "اتصل بنا" : "CONTACT US"%></div>
                                </li>
                                <li data-index="rs-200" 
                                    data-transition="parallaxvertical" 
                                    data-slotamount="default" 
                                    data-hideafterloop="0" 
                                    data-hideslideonmobile="off" 
                                    data-easein="default" 
                                    data-easeout="default" 
                                    data-masterspeed="default" 
                                    data-thumb="assets/images/slider/slide1.jpg" 
                                    data-rotate="0" 
                                    data-fstransition="fade" 
                                    data-fsmasterspeed="1500" 
                                    data-fsslotamount="7" 
                                    data-saveperformance="off" 
                                    data-title="A STUDY ON HAPPINESS" 
                                    data-param1="" data-param2="" 
                                    data-param3="" data-param4="" 
                                    data-param5="" data-param6="" 
                                    data-param7="" data-param8="" 
                                    data-param9="" data-param10="" 
                                    data-description="Science says that Women are generally happier">
                                    <!-- MAIN IMAGE -->
                                    <img src="assets/images/slider/slide2_temp.jpg" alt="" 
                                         data-bgposition="center center" 
                                         data-bgfit="cover" 
                                         data-bgrepeat="no-repeat" 
                                         data-bgparallax="10" 
                                         class="rev-slidebg" 
                                         data-no-retina />

                                    <!-- LAYER NR. 1 -->
                                    <div class="tp-caption tp-shape tp-shapewrapper " 
                                         id="slide-200-layer-1" 
                                         data-x="['center','center','center','center']" data-hoffset="['0','0','0','0']" 
                                         data-y="['middle','middle','middle','middle']" data-voffset="['0','0','0','0']" 
                                         data-width="full"
                                         data-height="full"
                                         data-whitespace="nowrap"
                                         data-type="shape" 
                                         data-basealign="slide" 
                                         data-responsive_offset="off" 
                                         data-responsive="off"
                                         data-frames='[{"from":"opacity:0;","speed":1,"to":"o:1;","delay":0,"ease":"Power4.easeOut"},{"delay":"wait","speed":1000,"to":"opacity:1;","ease":"Power4.easeOut"}]'
                                         data-textAlign="['left','left','left','left']"
                                         data-paddingtop="[0,0,0,0]"
                                         data-paddingright="[0,0,0,0]"
                                         data-paddingbottom="[0,0,0,0]"
                                         data-paddingleft="[0,0,0,0]"
                                         style="z-index: 5;background-color:rgba(2, 0, 11, 0.80);border-color:rgba(0, 0, 0, 0);border-width:0px;"> 
                                    </div>

                                    <!-- LAYER NR. 2 -->
                                    <div class="tp-caption Newspaper-Title   tp-resizeme" 
                                         id="slide-200-layer-2" 
                                         data-x="['center','center','center','center']" 
                                         data-hoffset="['0','0','0','0']" 
                                         data-y="['top','top','top','top']" 
                                         data-voffset="['250','250','250','240']" 
                                         data-fontsize="['50','50','50','30']"
                                         data-lineheight="['55','55','55','35']"
                                         data-width="full"
                                         data-height="none"
                                         data-whitespace="normal"
                                         data-type="text" 
                                         data-responsive_offset="on" 
                                         data-frames='[{"from":"y:[-100%];z:0;rX:0deg;rY:0;rZ:0;sX:1;sY:1;skX:0;skY:0;","mask":"x:0px;y:0px;s:inherit;e:inherit;","speed":1500,"to":"o:1;","delay":1000,"ease":"Power3.easeInOut"},{"delay":"wait","speed":1000,"to":"auto:auto;","mask":"x:0;y:0;s:inherit;e:inherit;","ease":"Power3.easeInOut"}]'
                                         data-textAlign="['center','center','center','center']"
                                         data-paddingtop="[0,0,0,0]"
                                         data-paddingright="[0,0,0,0]"
                                         data-paddingbottom="[10,10,10,10]"
                                         data-paddingleft="[0,0,0,0]"
                                         style="z-index: 6; font-family:rubik; font-weight:700; text-align:center; white-space: normal;text-transform:uppercase;">
                                        <%
                                            if (lang.equals("ar")) {
                                        %>
                                        مرحبا بكم في مودرن أكاديمي
                                        <%
                                        } else {
                                        %>                                        
                                        Welcome To Modern Academy
                                        <%
                                            }
                                        %>
                                    </div>

                                    <!-- LAYER NR. 3 -->
                                    <div class="tp-caption Newspaper-Subtitle   tp-resizeme" 
                                         id="slide-200-layer-3" 
                                         data-x="['center','center','center','center']" 
                                         data-hoffset="['0','0','0','0']" 
                                         data-y="['top','top','top','top']" 
                                         data-voffset="['210','210','210','210']" 
                                         data-width="none"
                                         data-height="none"
                                         data-whitespace="nowrap"
                                         data-type="text" 
                                         data-responsive_offset="on"
                                         data-frames='[{"from":"y:[-100%];z:0;rX:0deg;rY:0;rZ:0;sX:1;sY:1;skX:0;skY:0;","mask":"x:0px;y:0px;s:inherit;e:inherit;","speed":1500,"to":"o:1;","delay":1000,"ease":"Power3.easeInOut"},{"delay":"wait","speed":1000,"to":"auto:auto;","mask":"x:0;y:0;s:inherit;e:inherit;","ease":"Power3.easeInOut"}]'
                                         data-textAlign="['left','left','left','left']"
                                         data-paddingtop="[0,0,0,0]"
                                         data-paddingright="[0,0,0,0]"
                                         data-paddingbottom="[0,0,0,0]"
                                         data-paddingleft="[0,0,0,0]"
                                         style="z-index: 7; white-space: nowrap;text-transform:uppercase; color:#fff; font-family:rubik; font-size:18px; font-weight:400;">
                                        <%
                                            if (lang.equals("ar")) {
                                        %>
                                        تعليم أفضل لمستقبل أفضل
                                        <%
                                        } else {
                                        %>                                        
                                        Better Education For A Better Future
                                        <%
                                            }
                                        %>
                                    </div>

                                    <!-- LAYER NR. 4 -->
                                    <div class="tp-caption Newspaper-Button rev-btn " 
                                         id="slide-200-layer-5" 
                                         data-x="['center','center','center','center']" 
                                         data-hoffset="['90','80','75','90']" 
                                         data-y="['top','top','top','top']" 
                                         data-voffset="['400','400','400','420']" 
                                         data-width="none"
                                         data-height="none"
                                         data-whitespace="nowrap"
                                         data-type="button" 
                                         data-responsive_offset="on" 
                                         data-responsive="off"
                                         data-frames='[{"from":"y:[-100%];z:0;rX:0deg;rY:0;rZ:0;sX:1;sY:1;skX:0;skY:0;","mask":"x:0px;y:0px;","speed":1500,"to":"o:1;","delay":1000,"ease":"Power3.easeInOut"},{"delay":"wait","speed":1000,"to":"auto:auto;","mask":"x:0;y:0;","ease":"Power3.easeInOut"},{"frame":"hover","speed":"300","ease":"Power1.easeInOut","to":"o:1;rX:0;rY:0;rZ:0;z:0;","style":"c:rgba(0, 0, 0, 1.00);bg:rgba(255, 255, 255, 1.00);bc:rgba(255, 255, 255, 1.00);bw:1px 1px 1px 1px;"}]'
                                         data-textAlign="['center','center','center','center']"
                                         data-paddingtop="[12,12,12,12]"
                                         data-paddingright="[30,35,35,15]"
                                         data-paddingbottom="[12,12,12,12]"
                                         data-paddingleft="[30,35,35,15]"
                                         style="z-index: 8; white-space: nowrap; outline:none;box-shadow:none;box-sizing:border-box;-moz-box-sizing:border-box;-webkit-box-sizing:border-box;cursor:pointer; background-color:var(--primary) !important; border:0; border-radius:30px; margin-right:5px;">READ MORE </div>
                                    <div class="tp-caption Newspaper-Button rev-btn" 
                                         id="slide-200-layer-6" 
                                         data-x="['center','center','center','center']" 
                                         data-hoffset="['-90','-80','-75','-90']" 
                                         data-y="['top','top','top','top']" 
                                         data-voffset="['400','400','400','420']" 
                                         data-width="none"
                                         data-height="none"
                                         data-whitespace="nowrap"
                                         data-type="button" 
                                         data-responsive_offset="on" 
                                         data-responsive="off"
                                         data-frames='[{"from":"y:[-100%];z:0;rX:0deg;rY:0;rZ:0;sX:1;sY:1;skX:0;skY:0;","mask":"x:0px;y:0px;","speed":1500,"to":"o:1;","delay":1000,"ease":"Power3.easeInOut"},{"delay":"wait","speed":1000,"to":"auto:auto;","mask":"x:0;y:0;","ease":"Power3.easeInOut"},{"frame":"hover","speed":"300","ease":"Power1.easeInOut","to":"o:1;rX:0;rY:0;rZ:0;z:0;","style":"c:rgba(0, 0, 0, 1.00);bg:rgba(255, 255, 255, 1.00);bc:rgba(255, 255, 255, 1.00);bw:1px 1px 1px 1px;"}]'
                                         data-textAlign="['center','center','center','center']"
                                         data-paddingtop="[12,12,12,12]"
                                         data-paddingright="[30,35,35,15]"
                                         data-paddingbottom="[12,12,12,12]"
                                         data-paddingleft="[30,35,35,15]"
                                         style="z-index: 8; white-space: nowrap; outline:none;box-shadow:none;box-sizing:border-box;-moz-box-sizing:border-box;-webkit-box-sizing:border-box;cursor:pointer; border-radius:30px;">CONTACT US</div>
                                </li>                                
                                <!-- SLIDE  -->
                            </ul>
                        </div><!-- END REVOLUTION SLIDER -->  
                    </div>  
                </div>  
                <!-- Main Slider -->
                <div class="content-block">

                    <!-- Our Services -->
                    <div class="section-area content-inner service-info-bx">
                        <div class="container">
                            <div class="row">
                                <div class="col-lg-4 col-md-4 col-sm-6">
                                    <div class="service-bx">
                                        <div class="action-box">
                                            <img src="assets/images/our-services/pic1.jpg" alt="">
                                        </div>
                                        <div class="info-bx text-center">
                                            <div class="feature-box-sm radius bg-white">
                                                <i class="fa fa-bank text-primary"></i>
                                            </div>
                                            <h4><a href="#">Best Industry Leaders</a></h4>
                                            <a href="#" class="btn radius-xl">View More</a>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-4 col-md-4 col-sm-6">
                                    <div class="service-bx">
                                        <div class="action-box">
                                            <img src="assets/images/our-services/pic2.jpg" alt="">
                                        </div>
                                        <div class="info-bx text-center">
                                            <div class="feature-box-sm radius bg-white">
                                                <i class="fa fa-book text-primary"></i>
                                            </div>
                                            <h4><a href="#">Learn Courses Online</a></h4>
                                            <a href="#" class="btn radius-xl">View More</a>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-4 col-md-4 col-sm-12">
                                    <div class="service-bx m-b0">
                                        <div class="action-box">
                                            <img src="assets/images/our-services/pic3.jpg" alt="">
                                        </div>
                                        <div class="info-bx text-center">
                                            <div class="feature-box-sm radius bg-white">
                                                <i class="fa fa-file-text-o text-primary"></i>
                                            </div>
                                            <h4><a href="#">Book Library & Store</a></h4>
                                            <a href="#" class="btn radius-xl">View More</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- Our Services END -->

                    <!-- Form -->
                    <div class="section-area section-sp1 ovpr-dark bg-fix online-cours" style="background-image:url(assets/images/background/bg1.jpg);">
                        <div class="container">                            
                            <div class="mw800 m-auto">
                                <div class="row">
                                    <div class="col-md-3 col-sm-6">
                                        <div class="cours-search-bx m-b30">
                                            <div class="icon-box">
                                                <h3><i class="ti-user"></i><span class="counter">5</span>M</h3>
                                            </div>
                                            <span class="cours-search-text">Over 5 million Student</span>
                                        </div>
                                    </div>
                                    <div class="col-md-3 col-sm-6">
                                        <div class="cours-search-bx m-b30">
                                            <div class="icon-box">
                                                <h3><i class="ti-book"></i><span class="counter">30</span>K</h3>
                                            </div>
                                            <span class="cours-search-text">Over 30,000 Courses.</span>
                                        </div>
                                    </div>
                                    <div class="col-md-3 col-sm-12">
                                        <div class="cours-search-bx m-b30">
                                            <div class="icon-box">
                                                <h3><i class="ti-layout-list-post"></i><span class="counter">100</span></h3>
                                            </div>
                                            <span class="cours-search-text">Over 1 Hundred Doctor</span>
                                        </div>
                                    </div>
                                    <div class="col-md-3 col-sm-12">
                                        <div class="cours-search-bx m-b30">
                                            <div class="icon-box">
                                                <h3><i class="ti-layout-list-post"></i><span class="counter">50</span></h3>
                                            </div>
                                            <span class="cours-search-text">Over 50 Associate Faculty Members</span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- Form END -->
                    <div class="section-area section-sp2">
                        <div class="container">
                            <div class="row">
                                <div class="col-md-12 text-center heading-bx">
                                    <h2 class="title-head m-b0">
                                        <%=(lang.equals("ar")) ? "البرامج <span>المتاحة</span>" : "Available <span>Programs</span>"%>
                                    </h2>
                                    <p class="m-b0"><%=(lang.equals("ar")) ? "البرامج التعليمية المتاحة" : "Available Educational Programs. "%></p>
                                </div>
                            </div>
                            <div class="row">
                                <div class="upcoming-event-carousel owl-carousel owl-btn-center-lr owl-btn-1 col-12 p-lr0  m-b30">
                                    <div class="item">
                                        <div class="event-bx">
                                            <div class="action-box">
                                                <img src="assets/images/event/pic4.jpg" alt="">
                                            </div>
                                            <div class="info-bx d-flex">
                                                <div>
                                                    <div class="event-time">
                                                        <div class="event-date">1</div>
                                                    </div>
                                                </div>
                                                <div class="event-info">
                                                    <h4 class="event-title">
                                                        <a href="#">
                                                            <%=(lang.equals("ar")) ? "هندسة الكمبيوتر وتكنولوجيا المعلومات" : "Computer Engineering & Information Technology"%>
                                                        </a>
                                                    </h4>                                                    
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="item">
                                        <div class="event-bx">
                                            <div class="action-box">
                                                <img src="assets/images/event/pic3.jpg" alt="">
                                            </div>
                                            <div class="info-bx d-flex">
                                                <div>
                                                    <div class="event-time">
                                                        <div class="event-date">2</div>
                                                    </div>
                                                </div>
                                                <div class="event-info">
                                                    <h4 class="event-title">
                                                        <a href="#">
                                                            <%=(lang.equals("ar")) ? "هندسة الإلكترونيات والاتصالات" : "Electronics & Communications Engineering"%>
                                                        </a>
                                                    </h4>                                                    
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="item">
                                        <div class="event-bx">
                                            <div class="action-box">
                                                <img src="assets/images/event/pic2.jpg" alt="">
                                            </div>
                                            <div class="info-bx d-flex">
                                                <div>
                                                    <div class="event-time">
                                                        <div class="event-date">3</div>
                                                    </div>
                                                </div>
                                                <div class="event-info">
                                                    <h4 class="event-title">
                                                        <a href="#">
                                                            <%=(lang.equals("ar")) ? "هندسة التصنيع" : "Manufacturing Engineering"%>
                                                        </a>
                                                    </h4>                                                    
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="item">
                                        <div class="event-bx">
                                            <div class="action-box">
                                                <img src="assets/images/event/pic2.jpg" alt="">
                                            </div>
                                            <div class="info-bx d-flex">
                                                <div>
                                                    <div class="event-time">
                                                        <div class="event-date">4</div>
                                                    </div>
                                                </div>
                                                <div class="event-info">
                                                    <h4 class="event-title">
                                                        <a href="#">
                                                            <%=(lang.equals("ar")) ? "الهندسة المعمارية" : "Architectural Engineering"%>
                                                        </a>
                                                    </h4>                                                    
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Testimonials -->
                    <div class="section-area section-sp2 bg-fix ovbl-dark" style="background-image:url(assets/images/background/bg1.jpg);">
                        <div class="container">
                            <div class="row">
                                <div class="col-md-12 text-white heading-bx left">
                                    <h2 class="title-head text-uppercase">
                                        <%=(lang.equals("ar")) ? " كلمات <span> أعضاء هيئة التدريس</span>" : "what people <span>say</span>"%>
                                    </h2>                                   
                                </div>
                            </div>
                            <div class="testimonial-carousel owl-carousel owl-btn-1 col-12 p-lr0">
                                <div class="item">
                                    <div class="testimonial-bx">
                                        <div class="testimonial-thumb">
                                            <img src="assets/images/testimonials/pic1.jpg" alt="">
                                        </div>
                                        <div class="testimonial-info">
                                            <h5 class="name">Peter Packer</h5>
                                            <p>-Art Director</p>
                                        </div>
                                        <div class="testimonial-content">
                                            <p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type...</p>
                                        </div>
                                    </div>
                                </div>
                                <div class="item">
                                    <div class="testimonial-bx">
                                        <div class="testimonial-thumb">
                                            <img src="assets/images/testimonials/pic2.jpg" alt="">
                                        </div>
                                        <div class="testimonial-info">
                                            <h5 class="name">Peter Packer</h5>
                                            <p>-Art Director</p>
                                        </div>
                                        <div class="testimonial-content">
                                            <p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type...</p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- Testimonials END -->

                    <!-- Recent News -->
                    <div class="section-area section-sp2">
                        <div class="container">
                            <div class="row">
                                <div class="col-md-12 text-center heading-bx">
                                    <h2 class="title-head m-b0"><%=(lang.equals("ar")) ? "آخر <span>الأخبار</span>" : "Recent <span>News</span>"%></h2>                                    
                                    <p><%=(lang.equals("ar")) ? "آخر أخبار الأكاديمي" : "Latest Academy news"%>ة</p>
                                </div>
                            </div>
                            <div class="recent-news-carousel owl-carousel owl-btn-1 col-12 p-lr0">
                                <div class="item">
                                    <div class="recent-news">
                                        <div class="action-box">
                                            <img src="assets/images/blog/latest-blog/pic1.jpg" alt="">
                                        </div>
                                        <div class="info-bx">
                                            <ul class="media-post">
                                                <li><a href="#"><i class="fa fa-calendar"></i>Jan 03 2019</a></li>
                                                <li><a href="#"><i class="fa fa-user"></i>By William</a></li>
                                            </ul>
                                            <h5 class="post-title"><a href="blog-details.html">This Story Behind Education Will Haunt You Forever.</a></h5>
                                            <p>Knowing that, You’ve optimised your pages countless amount of times, written tons.</p>
                                            <div class="post-extra">
                                                <a href="#" class="btn-link">READ MORE</a>
                                                <a href="#" class="comments-bx"><i class="fa fa-comments-o"></i>20 Comment</a>
                                            </div>
                                        </div>
                                    </div>
                                </div>                                
                            </div>
                        </div>
                    </div>
                    <!-- Recent News End -->

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
                                    %>
                                </div>
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

        <!-- Revolution JavaScripts Files -->
        <script src="assets/vendors/revolution/js/jquery.themepunch.tools.min.js"></script>
        <script src="assets/vendors/revolution/js/jquery.themepunch.revolution.min.js"></script>
        <!-- Slider revolution 5.0 Extensions  (Load Extensions only on Local File Systems !  The following part can be removed on Server for On Demand Loading) -->
        <script src="assets/vendors/revolution/js/extensions/revolution.extension.actions.min.js"></script>
        <script src="assets/vendors/revolution/js/extensions/revolution.extension.carousel.min.js"></script>
        <script src="assets/vendors/revolution/js/extensions/revolution.extension.kenburn.min.js"></script>
        <script src="assets/vendors/revolution/js/extensions/revolution.extension.layeranimation.min.js"></script>
        <script src="assets/vendors/revolution/js/extensions/revolution.extension.migration.min.js"></script>
        <script src="assets/vendors/revolution/js/extensions/revolution.extension.navigation.min.js"></script>
        <script src="assets/vendors/revolution/js/extensions/revolution.extension.parallax.min.js"></script>
        <script src="assets/vendors/revolution/js/extensions/revolution.extension.slideanims.min.js"></script>
        <script src="assets/vendors/revolution/js/extensions/revolution.extension.video.min.js"></script>
        <script src="_000_site_index.js"></script>
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