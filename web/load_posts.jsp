<%-- 
    Document   : load_posts
    Created on : 17-Jun-2021, 4:16:43 pm
    Author     : Pratik Dange <@PratikDange999>
--%>

<%@page import="com.edtech.blog.entities.User"%>
<%@page import="com.edtech.blog.dao.LikeDao"%>
<%@page import="com.edtech.blog.entities.Post"%>
<%@page import="java.util.List"%>
<%@page import="com.edtech.blog.helper.ConnectionProvider"%>
<%@page import="com.edtech.blog.dao.PostDao"%>

<div class="row">

<% 
    User uuu=(User)session.getAttribute("currentUser");
    Thread.sleep(100);
    PostDao d=new PostDao(ConnectionProvider.getConnection());
    
    int cid=Integer.parseInt(request.getParameter("cid"));
    List<Post> posts=null;
    if(cid==0)
    {
    posts= d.getAllPosts();
    } else {
        posts=d.getPostByCatId(cid);
    }
    
    if(posts.size()==0)
    {
        out.println("<h3 class='display-3 text-center'> NO posts in this category!<h3>");
        return;
    }
    
    for(Post p:posts)
    {
        %>

        <div class="col-md-6 mt-2">
            <div class="card">
                <img class="card-img-top" src="blog_pics/<%= p.getpPic()%>" alt="Card image cap">
                <div class="card-body">
                    <b><%= p.getpTitle() %></b>
                    <p><%= p.getpContent()%></p>
                    
                </div>
                    <div class="card-footer text-center primary-background">
                        
                        <% 
                            LikeDao ld=new LikeDao(ConnectionProvider.getConnection());
                        %>
                        
                        <a href="#!" onclick="doLike(<%= p.getPid() %>,<%= uuu.getId() %>)" class="btn btn-outline-light btn-sm" ><i class="fa fa-thumbs-o-up"><span class="like-counter"><%= ld.countLikeOnPost(p.getPid()) %></span></i></a>
                        <a href="show_blog_post.jsp?post_id=<%= p.getPid() %>" class="btn btn-outline-light btn-sm" >Read More</a>
                        <a href="#!" class="btn btn-outline-light btn-sm" ><i class="fa fa-commenting-o"><span>5</span></i></a>
                    </div>
                
            </div>
            
        </div>  
        
        
<%        
    }
    

%>
</div>