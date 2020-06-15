package com.google.appengine;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(
    name = "HelloAppEngine",
    urlPatterns = {"/hello"}
)
public class HelloAppEngine extends HttpServlet {

  @Override
  public void doPost(HttpServletRequest request, HttpServletResponse response) 
      throws IOException, ServletException {

    response.setContentType("text/html");
    response.setCharacterEncoding("UTF-8");
    PrintWriter out=response.getWriter();
    
    
	JDBCConnection jdbc_connect_cloud = new JDBCConnection();
	
	List<Movie> movieList = new ArrayList<Movie>();
	
    String[] categories = request.getParameterValues("category");
    String ratings = request.getParameter("ratings");
    String whereClauseCategory = "";
    String whereClauseRating = "";
    
    if(categories != null) {
		
		whereClauseCategory = "(";
		
		for(String s: categories) {
			whereClauseCategory = whereClauseCategory + "GENRES = '"+ s +"' OR ";
		}
		
		whereClauseCategory = whereClauseCategory.substring(0, whereClauseCategory.length() - 4);
		whereClauseCategory = whereClauseCategory + " )";
		if(ratings != null)
			whereClauseCategory = whereClauseCategory + " AND ";
		
		System.out.println(whereClauseCategory);
		
    } 
    if(ratings != null) {
    	whereClauseRating = whereClauseRating + "VOTE_AVERAGE <= "+ ratings;
    	System.out.println(ratings);
    }
    
    String query = "";
    if(categories != null && ratings != null)
		query = "SELECT TITLE, VOTE_AVERAGE, ORIGINAL_LANGUAGE, GENRES, PRODUCTION_COMPANIES, OVERVIEW FROM movie_details WHERE " + whereClauseCategory + " " + whereClauseRating + " ORDER BY VOTE_AVERAGE DESC limit 10";
    else if(categories == null && ratings == null)
    	query = "SELECT TITLE, VOTE_AVERAGE, ORIGINAL_LANGUAGE, GENRES, PRODUCTION_COMPANIES, OVERVIEW FROM movie_details ORDER BY VOTE_AVERAGE DESC limit 10";
    else if(ratings == null)
    	query = "SELECT TITLE, VOTE_AVERAGE, ORIGINAL_LANGUAGE, GENRES, PRODUCTION_COMPANIES, OVERVIEW FROM movie_details WHERE " + whereClauseCategory + " ORDER BY VOTE_AVERAGE DESC limit 10";
    else if(categories == null)
    	query = "SELECT TITLE, VOTE_AVERAGE, ORIGINAL_LANGUAGE, GENRES, PRODUCTION_COMPANIES, OVERVIEW FROM movie_details WHERE " + whereClauseRating + " ORDER BY VOTE_AVERAGE DESC limit 10";
   
    System.out.println(query);
	ResultSet rs = jdbc_connect_cloud.connectToCloudJDBC(query);
		 
	try {
		while (rs.next()) {
			
			Movie movie = new Movie();
			movie.setOriginalTitle(rs.getString("TITLE").replaceAll("'-'",","));
			movie.setPopularity(rs.getFloat("VOTE_AVERAGE"));
			movie.setOriginalLanguage(rs.getString("ORIGINAL_LANGUAGE"));
			movie.setGenres(rs.getString("GENRES"));
			movie.setProductionCompanies(rs.getString("PRODUCTION_COMPANIES").replaceAll("'-'",","));
			movie.setOverview(rs.getString("OVERVIEW").replaceAll("'-'",","));
			movieList.add(movie);			
		}
		request.setAttribute("movieList", movieList);
        RequestDispatcher view = request.getRequestDispatcher("content.jsp");
        view.forward(request, response);
	} catch(SQLException e) {
		 e.printStackTrace(); 
	}
  }
}