<%-- 
    Document   : profile
    Created on : 09-Jun-2021, 9:17:07 pm
    Author     : Pratik Dange <@PratikDange999>
--%>
<%@page import="com.edtech.blog.entities.Category"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.edtech.blog.helper.ConnectionProvider"%>
<%@page import="com.edtech.blog.dao.PostDao"%>
<%@page import="com.edtech.blog.entities.Message"%>
<%@page import="com.edtech.blog.entities.User"%>
<%@page errorPage="error_page.jsp" %>
<% 

User user = (User)session.getAttribute("currentUser");
if(user==null)
{
    response.sendRedirect("login_page.jsp");
    
}

%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <!--CSS-->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link href="css/mystyle.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"> 
        <style>
            .banner-background{
               
               clip-path: polygon(0 0, 100% 0%, 100% 100%, 0 90%);
            }
            body{
                background: url(img/blog_post_img.jpg); 
                background-size: cover;
                background-attachment: fixed;
            }
        </style>
        
    </head>
    <body>
  
        <!-- navbar-->
        <nav class="navbar navbar-expand-lg navbar-dark primary-background">
            <a class="navbar-brand" href="index.jsp"><span class="fa fa-bolt"></span> EdTech Blog</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav mr-auto">
                    <li class="nav-item active">
                        <a class="nav-link" href="#"><span class="fa fa-book"></span> LearnCode with ABMM<span class="sr-only">(current)</span></a>
                    </li>

                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <span class="fa fa-archive"></span> Categories
                        </a>
                        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                            <a class="dropdown-item" href="#">Programming Languages</a>
                            <a class="dropdown-item" href="#">Project Implementation</a>
                            <div class="dropdown-divider"></div>
                            <a class="dropdown-item" href="#">Data Structures</a>
                        </div>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#"><span class="fa fa-address-book-o"></span> Contact Us</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#" data-toggle="modal" data-target="#add-post-modal"><span class="fa fa-laptop"></span> POST</a>
                    </li>
                </ul>
                
                <ul class="navbar-nav mr-right ">
                    <li class="nav-item">
                        <a class="nav-link" href="#!" data-toggle="modal" data-target="#profile-modal"><span class="fa fa-user-circle"></span> <%= user.getName() %> </a>
                    </li>
                    
                    <li class="nav-item">
                        <a class="nav-link" href="LogoutServlet"><span class="fa fa fa-sign-out"></span> Log-Out</a>
                    </li>
                </ul>
            </div>
        </nav>
        <!--End of NavBar-->
        
        <%

            Message m = (Message) session.getAttribute("msg");
            if (m != null) {
        %>

        <div class="alert <%= m.getCssClass()%>" role="alert">
            <%= m.getContent()%> 
        </div>                            

        <%
                session.removeAttribute("msg");
            }
        %>
        
        
        <!--Main Body of the page-->
        
        <main>
            <div class="container">
                <div class="row mt-4">
                    <!--First Column-->
                    <div class="col-md-4">
                        <!--List of Categories-->
                        <div class="list-group">
                            <a href="#" onclick="getPosts(0,this)" class="c-link list-group-item list-group-item-action active">
                                All Posts
                            </a>
                            <!--Categories-->
                            <% 
                                PostDao d=new PostDao(ConnectionProvider.getConnection());
                                ArrayList<Category> list1=d.getAllCategories();
                                for(Category cc:list1)
                                {
                            %>
                            <a href="#" onclick="getPosts(<%= cc.getCid()%>,this)" class="c-link list-group-item list-group-item-action"><%= cc.getName() %></a>
                            <% 
                                }
                            %>
                        </div>
                    </div>
                    
                    <!--Second Column-->
                    <div class="col-md-8">
                        <!--Posts-->
                        <div class="container text-center" id="loader">
                            <i class="fa fa-refresh fa-4x fa-spin"></i>
                            <h3 class="mt-2">LOADING....</h3>
                        </div>
                        
                        <div class="container-fluid"id="post-container">
                            
                        </div>
                    </div>
                </div>
            </div>
        </main>
        
        <!-- End of Main Body of the page-->
        
        
        <!-- Profile Modal-->
       
        <!-- Modal -->
        <div class="modal fade" id="profile-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header primary-background text-white text-center">
                        <h5 class="modal-title" id="exampleModalLabel">EdTech BLOG</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">

                        <br>
                        <div class="container text-center">
                        
                            <img src="pics/<%= user.getProfile() %>" class="image-fluid" style="border-radius:50%; max-width: 150px; ">
                            <br>
                            <h5 class="modal-title mt-3" id="exampleModalLabel"><%= user.getName() %></h5>
                            
                            <!-- Profile Details-->
                            <div id="profile-details">
                            <table class="table">

                                <tbody>
                                    <tr>
                                        <th scope="row"> ID :</th>
                                        <td> <%= user.getId() %> </td>
                                        
                                    </tr>
                                    <tr>
                                        <th scope="row"> Email :</th>
                                        <td> <%= user.getEmail()%></td>

                                    </tr>
                                    <tr>
                                        <th scope="row"> About :</th>
                                        <td> <%= user.getAbout()%></td>

                                    </tr>
                                    <tr>
                                        <th scope="row"> Gender :</th>
                                        <td> <%= user.getGender()%></td>

                                    </tr>
                                    <tr>
                                        <th scope="row"> Reg-Date :</th>
                                        <td> <%= user.getDateTime().toString() %></td>

                                    </tr>
                                </tbody>
                            </table>                        
                            </div>
                                        
                            <!-- Profile-Editing-->
                            <div id="profile-edit" style="display: none">
                                
                                <h3 class="mt-2"> Please edit carefully!</h3>
                                
                                <form action="EditServlet" method="post" enctype="multipart/form-data">
                                    
                                    <table class="table">
                                        
                                        <tr>
                                            <td> ID :</td>
                                            <td> <%= user.getId() %> </td>
                                        </tr>
                                        <tr>
                                            <td> Email :</td>
                                            <td> <input type="email" class="form-control" name="user_email" value="<%= user.getEmail()%>"> </td>
                                        </tr>
                                        <tr>
                                            <td> Name :</td>
                                            <td> <input type="text" class="form-control" name="user_name" value="<%= user.getName()%>"> </td>
                                        </tr>
                                        <tr>
                                            <td> Password :</td>
                                            <td> <input type="password" class="form-control" name="user_password" value="<%= user.getPassword()%>"> </td>
                                        </tr>
                                        <tr>
                                            <td> Gender :</td>
                                            <td> <%= user.getGender().toUpperCase() %> </td>
                                        </tr>
                                        <tr>
                                            <td> About :</td>
                                            <td> 
                                            
                                                <textarea rows="5" class="form-control" name="user_about" ><%= user.getAbout() %></textarea>
                                                
                                            </td>
                                        </tr>
                                        <tr>
                                            <td> Profile Picture:</td>
                                            <td> 
                                            
                                                <input type="file" name="image" class="form-control"> 
                                                
                                            </td>
                                        </tr>
                                        
                                    </table>
                                                                                                                       
                                                <div class="container">
                                                    <button type="submit" class="btn btn-outline-primary">Save</button>
                                                </div>
                                                
                                </form>
                                
                            </div>
                                        
                                        
                        </div>                                    
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                        <button id="edit-profile-button" type="button" class="btn btn-primary">Edit</button>
                    </div>
                </div>
            </div> 
        </div>
        <!-- end of profile modal-->
        
        <!-- Add post modal-->
        
        <!-- Modal -->
        <div class="modal fade" id="add-post-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Enter Post Details</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        
                        <form id="add-post-form" action="AddPostServlet" method="post">
                            
                            <div class="form-group">
                                <select class="form-control" name="cid">
                                    <option selected disabled>---Select Category---</option>
                                    
                                    <% 
                                    PostDao postd= new PostDao(ConnectionProvider.getConnection());
                                     ArrayList<Category> list =postd.getAllCategories();
                                     for(Category c:list)
                                     {
                                    %>
                                    <option value="<%= c.getCid() %>"><%= c.getName() %></option>
                                    
                                    <% 
                                        }
                                    %>
                                </select>
                            </div>
                            
                            <div class="form-group" >
                                <input name="pTitle" type="text" placeholder="Enter Post Title" class="form-control">
                            </div>
                            
                            <div class="form-group">
                                <textarea name="pContent" class="form-control" placeholder="Enter your Content" style="height: 200px;"></textarea>
                            </div>
                            <div class="form-group">
                                <textarea name="pCode" class="form-control" placeholder="Enter your Program(If any)" style="height: 100px;"></textarea>
                            </div>
                            <div class="form-group">
                                <label>Select Photo location</label>
                                <br>
                                <input name="pic" type="file" >
                            </div>
                                <div class="container text-center">
                                    <button type="submit" class="btn-outline-primary">POST</button>
                                </div>
                            
                        </form>
                        
                        
                    </div>

                </div>
            </div>
        </div>
                           
        <!-- end of add post modal-->
        
        
        <!-- javaScripts -->
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"
        integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
        crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script> 
        <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js" integrity="sha512-AA1Bzp5Q0K1KanKKmvN/4d3IRKVlv9PYgwFPvm32nPO6QS8yH1HO7LbgB1pgiOxPtfeg5zEn2ba64MUcqJx6CA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
        <script src="js/myjs.js" type="text/javascript"></script>
        
        <script>
            $(document).ready(function(){
                
                let editStatus= false;
                
        
                $('#edit-profile-button').click(function(){
                    
                    if(editStatus === false)
                    {
                        
                                              
                        //alert("button clicked")
                        $("#profile-details").hide()
                    
                        $("#profile-edit").show()                      
                        editStatus = true;
                        $(this).text("Back")
                    } else{
                        $("#profile-details").show()
                    
                        $("#profile-edit").hide()
                        editStatus = false;
                        $(this).text("Edit")
                        
                        
                    }

                    
                })
        
            });
        </script>
        
        <!-- now addPost js-->
        <script>
        $(document).ready(function(e){
            
            //
            $("#add-post-form").on("submit",function(event){
                //this code gets called when form is submitted
                event.preventDefault();
                console.log("you have clicked on submit");
                let form=new FormData(this);
                
                //now requesting to server
                $.ajax({
                    url: "AddPostServlet",
                    type: "post",
                    data: form,
                    success: function(data, textStatus, jqXHR) {
                        //success
                        console.log(data);
                        if(data.trim()=='Post Saved Successfully!')
                        {
                            swal("Good job!", "Post Saved Successfully!", "success");
                        } else
                        {
                            swal("Error!", "Something Went Wrong, Try Again!", "error");
                        }
                    },
                    error: function(jqXHR, textStatus, errorThrown){
                        //error
                        swal("Error!", "Something Went Wrong, Try Again!", "error");
                    },
                    processData: false,
                    contentType: false
                    
                })
            })
            
        })    
        </script>
        
        <!--Loading posts using AJAX-->
        <script>
            
            function getPosts(catId, temp){
                $("#loader").show();
                $("#post-container").hide();
                
                $(".c-link").removeClass('active');
                
                $.ajax({
                    url: "load_posts.jsp",
                    data: {cid:catId},
                    success: function (data, textStatus, jqXHR){
                        console.log(data);
                        $("#loader").hide();
                        $("#post-container").show();
                        $("#post-container").html(data);
                        $(temp).addClass('active')
                    }
                })
            }
            
            $(document).ready(function(e){
                let allPostRef=$('.c-link')[0]
                getPosts(0, allPostRef)
                
                
            
            })
        </script>
        
    </body>
</html>
