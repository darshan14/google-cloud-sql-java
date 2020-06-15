package com.google.appengine;

import java.sql.ResultSet;
import java.sql.SQLException;

public class Movie {

	private String originalTitle;
	private float popularity;
	private String originalLanguage;
	private String genres;
	private String productionCompanies;
	private String overview;
	
	public String getOriginalTitle() {
		return originalTitle;
	}
	public void setOriginalTitle(String originalTitle) {
		this.originalTitle = originalTitle;
	}
	public float getPopularity() {
		return popularity;
	}
	public void setPopularity(float popularity) {
		this.popularity = popularity;
	}
	public String getOriginalLanguage() {
		return originalLanguage;
	}
	public void setOriginalLanguage(String originalLanguage) {
		this.originalLanguage = originalLanguage;
	}
	public String getGenres() {
		return genres;
	}
	public void setGenres(String genres) {
		this.genres = genres;
	}
	public String getProductionCompanies() {
		return productionCompanies;
	}
	public void setProductionCompanies(String productionCompanies) {
		this.productionCompanies = productionCompanies;
	}
	public String getOverview() {
		return overview;
	}
	public void setOverview(String overview) {
		this.overview = overview;
	}
}
