<%@ page language="java" contentType="text/html; charset=UTF-8"
 pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0,maximum-scale=1">

    <title>Movie Review</title>
    <!-- Loading third party fonts -->
    <link href="http://fonts.googleapis.com/css?family=Roboto:300,400,700|" rel="stylesheet" type="text/css">
    <link href="fonts/font-awesome.min.css" rel="stylesheet" type="text/css">
    <!-- Loading main css file -->
    <link rel="stylesheet" href="style.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
    <script src="JavaScript.js"></script>
    <!--[if lt IE 9]>
    <script src="js/ie-support/html5.js"></script>
    <script src="js/ie-support/respond.js"></script>
    <![endif]-->
</head>

<body>

    <div id="site-content">
        <header class="site-header">
            <div class="container">
                <a href="index.html" id="branding">
                    <img src="images/logo.png" alt="" class="logo">
                    <div class="logo-copy">
                        <h1 class="site-title">Movie World</h1>
                        <small class="site-description">Movie search website</small>
                    </div>
                </a>
                <div class="main-navigation">
                    <button type="button" class="menu-toggle"><i class="fa fa-bars"></i></button>
                    <ul class="menu">
                        <li class="menu-item current-menu-item"><a href="index.html">Home</a></li>
                        <li class="menu-item"><a href="analytics.html">Analytics</a></li>
                        <li class="menu-item"><a href="contact.html">Contact</a></li>
                    </ul> <!-- .menu -->
                    <form action="#" class="search-form">
                        <input type="text" placeholder="Search...">
                        <button><i class="fa fa-search"></i></button>
                    </form>
                </div> <!-- .main-navigation -->
                <div class="mobile-navigation"></div>
            </div>
        </header>
        <main class="main-content">
            <div class="container-fluid" id="right-sidebar">

                <form action="#" id="form_id" class="form_id" onsubmit="myFunction()">
                    <h3>Please select Movie Category:</h3>
                    <input type="checkbox" class="Uncheck_class" name="category" value="All"> All<br>
                    <input type="checkbox" class="check_class" name="category" value="Thriller"> Thriller &nbsp;&nbsp;&nbsp;&nbsp;
                    <input type="checkbox" class="check_class" name="category" value="Drama & Romance"> Drama & Romance<br>
                    <input type="checkbox" class="check_class" name="category" value="Crime"> Crime &nbsp;&nbsp;&nbsp;&nbsp;
                    <input type="checkbox" class="check_class" name="category" value="Adventure"> Adventure<br>
                    <input type="checkbox" class="check_class" name="category" value="Science Fiction"> Science Fiction &nbsp;&nbsp;&nbsp;&nbsp;
                    <input type="checkbox" class="check_class" name="category" value="Drama"> Drama<br>
                    <input type="checkbox" class="check_class" name="category" value="Comedy"> Comedy &nbsp;&nbsp;&nbsp;&nbsp;
                    <input type="checkbox" class="check_class" name="category" value="Romance & Comedy"> Romance & Comedy<br>
                    <input type="checkbox" class="check_class" name="category" value="Documentary"> Documentary &nbsp;&nbsp;&nbsp;&nbsp;
                    <input type="checkbox" class="check_class" name="category" value="Fantasy"> Fantasy<br>
                    <input type="checkbox" class="check_class" name="category" value="Romance"> Romance &nbsp;&nbsp;&nbsp;&nbsp;
                    <input type="checkbox" class="check_class" name="category" value="Mystery"> Mystery<br>
                    <input type="checkbox" class="check_class" name="category" value="Horror"> Horror &nbsp;&nbsp;&nbsp;&nbsp;
                    <br />
                    <br />
                    <br />
                    <h3>Please select Movie ratings:</h3>
                    <input type="radio" name="ratings" value="3">3<br>
                    <input type="radio" name="ratings" value="5">5<br>
                    <input type="radio" name="ratings" value="10">10<br>
                    <br />
                    <br />
                    <input type="submit" value="Submit">
                </form>
            </div>
            
            <div class="breadcrumbs" style="margin-left:5%">>
                <a href="index.html">Home</a>
                <span>Movie data</span>
            </div>
            <div class="container" style="width:70%; margin-left:5%">
            
            <c:forEach items="${movieList}" var="movie" >
            
                <div class="feature" itemscope itemtype="http://schema.org/Movie">
                    <h4 itemprop="name" class="feature-title">${movie.originalTitle}</h4>
                    <span id="imdb_ratings">${movie.popularity}</span>
                    <small class="feature-subtitle">${movie.originalLanguage}</small><span itemprop="genre">${movie.genres}</span>
                    <p>
                        ${movie.productionCompanies}
                    </p>
                    <p> ${movie.overview} </p>
                </div>
            </c:forEach>
            </div>

        </main>
        <footer class="site-footer">
            <div class="container">
                <div class="row">
                    <div class="col-md-2">
                        <div class="widget">
                            <h3 class="widget-title">About Us</h3>
                            <p>Cloud Technologies Assignment 2, Group members Vedang, Darshan, Apurva, Aaditi and Sayli</p>
                        </div>
                    </div>
                    <div class="col-md-2">
                        <div class="widget">
                            <h3 class="widget-title">Recent Review</h3>
                            <ul class="no-bullet">
                                <li><a href="#">Bollywood</a></li>
                                <li><a href="#">Hollywood</a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-md-2">
                        <div class="widget">
                            <h3 class="widget-title">Social Media</h3>
                            <ul class="no-bullet">
                                <li><a href="#">Facebook</a></li>
                                <li><a href="#">Twitter</a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-md-2">
                        <div class="widget">
                            <h3 class="widget-title">Newsletter</h3>
                            <form action="#" class="subscribe-form">
                                <input type="text" placeholder="Email Address">
                            </form>
                        </div>
                    </div>
                </div>
                <div class="colophon">Copyright 2019 Cloud Technologies Assignment 2, Designed by Vedang,Darshan,Apurva Aaditi and Sayli. All rights aren't reserved</div>
            </div> <!-- .container -->
        </footer>
    </div>
    <!-- Default snippet for navigation -->


    <script src="js/jquery-1.11.1.min.js"></script>
    <script src="js/plugins.js"></script>
    <script src="js/app.js"></script>

</body>
</html>