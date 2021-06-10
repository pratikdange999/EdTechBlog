/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.edtech.blog.helper;
import java.sql.*;

/**
 *
 * @author Pratik Dange <@PratikDange999>
 */
public class ConnectionProvider {
    
    private static Connection con;
    public static Connection getConnection()
    {
        try{
           if(con==null)
           {
                //Load Driver Class
            Class.forName("com.mysql.jdbc.Driver");
            //Creating connection
            con=DriverManager.getConnection("jdbc:mysql://localhost:3306/edtechblog", "root", "Rootpassword");
            
           }
        }catch(Exception e)
        {
            e.printStackTrace();
        }
        return con;
    }

    
}
