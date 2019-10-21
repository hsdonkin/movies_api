class MoviesController < ApplicationController

  def welcome
    json_response({:message => "Welcome to the Movies API! This API was created from the MovieLens dataset, containing information on 45,000 feature films and television series. Query the following endpoints for movie data.", :popular => "/popular", :rating => "/rating", :longest => "/longest", :letter=>"letter/:letter", :specificTitle => "/title/:title", :rating => "/rating", :random => "/random"})
  end

  def index
    
      @movies = Movie.all.order("title ASC").limit(1000)
      json_response(@movies)
    
  end

  def show
    
      movie_id = params[:id]
      @movie = Movie.find(movie_id)
      json_response(@movie)
   
  end

  def random
 
      @movie = Movie.random
      json_response(@movie)
  
  end

  def longest
    
      @movie = Movie.longest
      json_response(@movie)
  
  end

  def rating

      @movie = Movie.rating
      json_response(@movie)
 
  end

  def popular
    
      @movie = Movie.popular
      json_response(@movie)
   
  end

  def letter

      letter = params[:letter]
      @movies = Movie.title_by_letter(letter)
      json_response(@movies)
 
  end

  def year_released

      year = params[:year]
      @movies = Movie.year_released(year)
      json_response(@movies)
   
  end

  def title

      title = params[:title]
      @movies = Movie.partial_title(title)
      json_response(@movies)
   
  end


  def authorize_apikey
    if params["apikey"] && Token.find_by_token_hash(params["apikey"])
      true
    else
      false
    end
  end

end
