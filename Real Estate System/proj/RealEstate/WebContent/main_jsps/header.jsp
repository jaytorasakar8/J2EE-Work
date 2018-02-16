<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
        <%@ page import="java.io.*,java.util.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<c:if test='${ user_id == null }'>
    <%
   response.setStatus(response.SC_MOVED_TEMPORARILY);
   response.setHeader("Location","?action=login"); 
   %>
</c:if>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>PropertyWala.com</title>
</head>
<!-- Favicon -->
    <link rel="shortcut icon" href="img/favicon.ico" type="image/x-icon">

    <!-- Font awesome -->
    <link href="css/font-awesome.css" rel="stylesheet">
    <!-- Bootstrap -->
    <link href="css/bootstrap.css" rel="stylesheet">   
    <!-- slick slider -->
    <link rel="stylesheet" type="text/css" href="css/slick.css">
    <!-- price picker slider -->
    <link rel="stylesheet" type="text/css" href="css/nouislider.css">
    <!-- Fancybox slider -->
    <link rel="stylesheet" href="css/jquery.fancybox.css" type="text/css" media="screen" /> 
    <!-- Theme color -->
    <link id="switcher" href="css/theme-color/default-theme.css" rel="stylesheet">     

    <!-- Main style sheet -->
    <link href="css/style.css" rel="stylesheet">    

   
    <!-- Google Font -->
    <link href='https://fonts.googleapis.com/css?family=Vollkorn' rel='stylesheet' type='text/css'>    
    <link href='https://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css'>
   
  </head>
  <body class="aa-price-range">  
  <!-- Pre Loader -->
 
  <!-- SCROLL TOP BUTTON -->
    <a class="scrollToTop" href="#"><i class="fa fa-angle-double-up"></i></a>
  <!-- END SCROLL TOP BUTTON -->

  <!-- Start menu section -->
  <section id="aa-menu-area">
    <nav class="navbar navbar-default main-navbar" role="navigation">  
      <div class="container">
        <div class="navbar-header">
          <!-- FOR MOBILE VIEW COLLAPSED BUTTON -->
          <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <!-- LOGO -->                                               
          <!-- Text based logo -->
           <a class="navbar-brand aa-logo" href="<%=request.getContextPath() %>/Buyer"> Property <span>Wala</span></a>
           <!-- Image based logo -->
           <!-- <a class="navbar-brand aa-logo-img" href="<%=request.getContextPath() %>"><img src="img/logo.png" alt="logo"></a> -->
        </div>
        <div id="navbar" class="navbar-collapse collapse">
          <ul id="top-menu" class="nav navbar-nav navbar-right aa-main-nav">
            <li class="active"><a href="<%=request.getContextPath() %>/Buyer">HOME</a></li>
             <li class="dropdown">
              <a class="dropdown-toggle" data-toggle="dropdown" href="properties.html">PROPERTIES <span class="caret"></span></a>
              <ul class="dropdown-menu" role="menu">                
                <li><a href="<%=request.getContextPath() %>/Buyer">BUY PROPERTY</a></li>
                <li><a href="<%=request.getContextPath() %>/Seller">SELL PROPERTY</a></li>                                            
              </ul>
            </li>
            <li><a href="#">GALLERY</a></li>                                         
            <li class="dropdown">
              <a class="dropdown-toggle" data-toggle="dropdown" href="blog-archive.html">BLOG <span class="caret"></span></a>
              <ul class="dropdown-menu" role="menu">                
                <li><a href="#">BLOG</a></li>
                <li><a href="#">BLOG DETAILS</a></li>                                            
              </ul>
            </li>
            <li><a href="#">CONTACT</a></li>
           <li><a href="<%=request.getContextPath() %>/UserLogin?action=logout">Logout</a></li>
          </ul>                            
        </div><!--/.nav-collapse -->       
      </div>          
    </nav> 
  </section>
  <!-- End menu section -->
<!-- Start slider  -->
  <section id="aa-slider">
    <div class="aa-slider-area"> 
      <!-- Top slider -->
      <div class="aa-top-slider">
        <!-- Top slider single slide -->
        <div class="aa-top-slider-single">
          <img src="img/slider/3.jpg" alt="img">
          <!-- Top slider content -->
          <div class="aa-top-slider-content">
            <span class="aa-top-slider-catg">Duplex</span>
            <h2 class="aa-top-slider-title">1160 Square Feet</h2>
            <p class="aa-top-slider-location"><i class="fa fa-map-marker"></i>Andheri</p>
            <span class="aa-top-slider-off">10% OFF</span>
            <p class="aa-top-slider-price">$160,000</p>
            <a href="#" class="aa-top-slider-btn">Read More <span class="fa fa-angle-double-right"></span></a>
          </div>
          <!-- / Top slider content -->
        </div>
        <!-- / Top slider single slide -->
        <!-- Top slider single slide -->
        <div class="aa-top-slider-single">
          <img src="img/slider/2.jpg" alt="img">
          <!-- Top slider content -->
          <div class="aa-top-slider-content">
            <span class="aa-top-slider-catg">Duplex</span>
            <h2 class="aa-top-slider-title">1260 Square Feet</h2>
            <p class="aa-top-slider-location"><i class="fa fa-map-marker"></i>Jogeshwari</p>
            <span class="aa-top-slider-off">20% OFF</span>
            <p class="aa-top-slider-price">$260,000</p>
            <a href="#" class="aa-top-slider-btn">Read More <span class="fa fa-angle-double-right"></span></a>
          </div>
          <!-- / Top slider content -->
        </div>
        <!-- / Top slider single slide -->
        <!-- Top slider single slide -->
        <div class="aa-top-slider-single">
          <img src="img/slider/1.jpg" alt="img">
          <!-- Top slider content -->
          <div class="aa-top-slider-content">
            <span class="aa-top-slider-catg">Duplex</span>
            <h2 class="aa-top-slider-title">1360 Square Feet</h2>
            <p class="aa-top-slider-location"><i class="fa fa-map-marker"></i>Goregaon</p>
            <span class="aa-top-slider-off">30% OFF</span>
            <p class="aa-top-slider-price">$360,000</p>
            <a href="#" class="aa-top-slider-btn">Read More <span class="fa fa-angle-double-right"></span></a>
          </div>
          <!-- / Top slider content -->
        </div>
        <!-- / Top slider single slide -->       
         <!-- Top slider single slide -->
        <div class="aa-top-slider-single">
          <img src="img/slider/5.jpg" alt="img">
          <!-- Top slider content -->
          <div class="aa-top-slider-content">
            <span class="aa-top-slider-catg">Duplex</span>
            <h2 class="aa-top-slider-title">1460 Square Feet</h2>
            <p class="aa-top-slider-location"><i class="fa fa-map-marker"></i>Malad</p>
            <span class="aa-top-slider-off">40% OFF</span>
            <p class="aa-top-slider-price">$460,000</p>
            <a href="#" class="aa-top-slider-btn">Read More <span class="fa fa-angle-double-right"></span></a>
          </div>
          <!-- / Top slider content -->
        </div>
        <!-- / Top slider single slide -->        
         <!-- Top slider single slide -->
        <div class="aa-top-slider-single">
          <img src="img/slider/4.jpg" alt="img">
          <!-- Top slider content -->
          <div class="aa-top-slider-content">
            <span class="aa-top-slider-catg">Duplex</span>
            <h2 class="aa-top-slider-title">1560 Square Feet</h2>
            <p class="aa-top-slider-location"><i class="fa fa-map-marker"></i>Juhu</p>
            <span class="aa-top-slider-off">50% OFF</span>
            <p class="aa-top-slider-price">$560,000</p>
            <a href="#" class="aa-top-slider-btn">Read More <span class="fa fa-angle-double-right"></span></a>
          </div>
          <!-- / Top slider content -->
        </div>
        <!-- / Top slider single slide -->
         <!-- Top slider single slide -->
        <div class="aa-top-slider-single">
          <img src="img/slider/6.jpg" alt="img">
          <!-- Top slider content -->
          <div class="aa-top-slider-content">
            <span class="aa-top-slider-catg">Duplex</span>
            <h2 class="aa-top-slider-title">1660 Square Feet</h2>
            <p class="aa-top-slider-location"><i class="fa fa-map-marker"></i>Borivali</p>
            <span class="aa-top-slider-off">60% OFF</span>
            <p class="aa-top-slider-price">$660,000</p>
            <a href="#" class="aa-top-slider-btn">Read More <span class="fa fa-angle-double-right"></span></a>
          </div>
          <!-- / Top slider content -->
        </div>
        <!-- / Top slider single slide -->
      </div>
    </div>
  </section>
  <!-- End slider  -->