<%-- 
    Document   : index
    Created on : 07-Jun-2021, 2:00:49 pm
    Author     : Pratik Dange <@PratikDange999>
--%>

<%@page import="com.edtech.blog.helper.ConnectionProvider"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <!--css-->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link href="css/mystyle.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"> 
        <!--<style>
            .banner-background{
               
               clip-path: polygon(30% 0%, 70% 0%, 100% 0, 100% 90%, 65% 100%, 32% 92%, 0 100%, 0 0);
            }
        </style>-->
        <style>
            .banner-background{
               
               clip-path: polygon(0 0, 100% 0%, 100% 100%, 0 90%);
            }
        </style>
    </head> 
    <body>
        
        <!--navbar-->
        <%@include file="normal_navbar.jsp" %>
        
        <!-- Banner-->
        
        <div class="container-fluid p-0 m-0">
            
            <div class="jumbotron primary-background text-white banner-background">
                <div class="container">
                <h3 class="display-tree">Welcome to EdTech Blog!</h3>            
                <p>Welcome to technical education blog, world of technology.
                    A programming language is a formal language comprising a set of strings that produce various kinds of machine code output. Programming languages are one kind of computer language, and are used in computer programming to implement algorithms.     
                </p>   
                <p>Most programming languages consist of instructions for computers. There are programmable machines that use a set of specific instructions, rather than general programming languages.
                </p>
                
                <a href="register_page.jsp" class="btn btn-outline-light "><span class="fa fa-user-plus"></span> Let's Begin, Its Free</a>  
                <a href="login_page.jsp" class="btn btn-outline-light "><span class="fa fa-sign-in fa-spin"></span> LogIn</a>  
                </div>
            </div>
            
        </div>
        <!-- Cards-->
        
        <div class="container">
            
            <div class="row">
                
                <div class="col-md-4">
                    <div class="card" >             
                    <div class="card-body">
                        <h5 class="card-title">Java Programming</h5>
                        <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                        <a href="#" class="btn primary-background text-white">Explore</a>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card" >             
                    <div class="card-body">
                        <h5 class="card-title">Java Programming</h5>
                        <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                        <a href="#" class="btn primary-background text-white">Explore</a>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card" >             
                    <div class="card-body">
                        <h5 class="card-title">Java Programming</h5>
                        <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                        <a href="#" class="btn primary-background text-white">Explore</a>
                        </div>
                    </div>
                </div>
                
            </div>
            <div class="row">
                
                <div class="col-md-4">
                    <div class="card" >             
                    <div class="card-body">
                        <h5 class="card-title">Java Programming</h5>
                        <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                        <a href="#" class="btn primary-background text-white">Explore</a>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card" >             
                    <div class="card-body">
                        <h5 class="card-title">Java Programming</h5>
                        <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                        <a href="#" class="btn primary-background text-white">Explore</a>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card" >             
                    <div class="card-body">
                        <h5 class="card-title">Java Programming</h5>
                        <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                        <a href="#" class="btn primary-background text-white">Explore</a>
                        </div>
                    </div>
                </div>
                
            </div>
            
        </div>
        


       
        <!-- javaScripts -->
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"
        integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
        crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script> 
        <!--To test working of jQuery
        <script>
            $(document).ready(function(){
                
                alert("good to go!")
            })
            </script>-->
        <script src="js/myjs.js" type="text/javascript"></script>
    </body>
</html>
