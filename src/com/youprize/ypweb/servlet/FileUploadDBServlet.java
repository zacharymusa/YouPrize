package com.youprize.ypweb.servlet;

 
import java.awt.image.BufferedImage;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.imageio.ImageIO;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
//import javax.websocket.Session;

import net.coobird.thumbnailator.Thumbnails;
 
@WebServlet("/uploadServlet")
@MultipartConfig(maxFileSize = 16177215)    // upload file's size up to 16MB
public class FileUploadDBServlet extends HttpServlet {
     //IMAD CHANGE
    // database connection settings
    private String dbURL = "jdbc:mysql://localhost:3306/YouPrize";
    private String dbUser = "root";
    private String dbPass = "";
    private int userID;
    
    
    protected void doPost(HttpServletRequest request,
            HttpServletResponse response) throws ServletException, IOException {
        // gets values of text fields
    	HttpSession session = request.getSession();  
    	userID = (int) session.getAttribute("userID");
        InputStream thumbnailStream = null; // input stream of the upload file
        InputStream origPicStream = null; 
        
        // obtains the upload file part in this multipart request
        Part filePart = request.getPart("photo");
        
        if (filePart != null) {
            // prints out some information for debugging
            System.out.println(filePart.getName());
            System.out.println(filePart.getSize());
            System.out.println(filePart.getContentType());
             
            // obtains input stream of the upload file
            thumbnailStream = filePart.getInputStream();
            origPicStream = filePart.getInputStream();
            BufferedImage originalImage = ImageIO.read(thumbnailStream);
            
            BufferedImage thumbnail = Thumbnails.of(originalImage)
                    .size(200, 200)
                    .asBufferedImage();
            ByteArrayOutputStream os = new ByteArrayOutputStream();
            ImageIO.write(thumbnail, "jpg", os);
            
            thumbnailStream = new ByteArrayInputStream(os.toByteArray());

        }
         
        Connection conn = null; // connection to the database
        String message = null;  // message will be sent back to client
         
        try {
            // connects to the database
            DriverManager.registerDriver(new com.mysql.jdbc.Driver());
            conn = DriverManager.getConnection(dbURL, dbUser, dbPass);
 
            // constructs SQL statement
            String sql = "INSERT INTO photo (Thumbnail,PhotoBlob,UserID,DateUploaded,IsInappropriate) values (?,?,?,now(),0)";
            PreparedStatement statement = conn.prepareStatement(sql);
            if (origPicStream != null) {
                // fetches input stream of the upload file for the blob column
            	statement.setBlob(1, thumbnailStream);
                statement.setBlob(2, origPicStream);
                statement.setInt(3, userID);
            }
            // sends the statement to the database server
            int row = statement.executeUpdate();
            if (row > 0) {
                message = "File uploaded and saved into database";
          //      request.getRequestDispatcher("Content.jsp").forward(request, response);
            }
        } catch (SQLException ex) {
            message = "ERROR: " + ex.getMessage();
            ex.printStackTrace();
        } finally {
            if (conn != null) {
                // closes the database connection
                try {
                    conn.close();
                } catch (SQLException ex) {
                    ex.printStackTrace();
                }
            }
            // sets the message in request scope
            request.setAttribute("Message", message);
             
            // forwards to the message page
            getServletContext().getRequestDispatcher("/Content.jsp").forward(request, response);
        }
    }
}
