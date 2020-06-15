<%@ page language="java" contentType="text/html; charset=UTF-8"
 pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<!DOCTYPE html>
<html>
 <head>
    <meta charset="UTF-8">
    <title>Product List</title>
 </head>
 <body>
 
    <h3>Product List</h3>
 
    <p style="color: red;">${errorString}</p>
 
    <table border="1" >
       <tr>
          <th>Code</th>
          <th>Name</th>
          <th>Price</th>
       </tr>
       <c:forEach items="${movieList}" var="movie" >
          <tr>
             <td>${movie.originalTitle}</td>
             <td>${movie.popularity}</td>
             <td>${movie.genres}</td>
          </tr>
       </c:forEach>
    </table>
 
    <a href="createProduct" >Create Product</a>
 
 </body>
</html>