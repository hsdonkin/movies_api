class MoviesController < ApplicationController

  def index
    if authorize_apikey
      @movies = Movie.all.order("title ASC").limit(1000)
      json_response(@movies)
    else
      json_response({:message => "Use an apikey for access"})
    end
  end

  def show
    if authorize_apikey
      movie_id = params[:id]
      @movie = Movie.find(movie_id)
      json_response(@movie)
    else
      json_response({:message => "Use an apikey for access"})
    end
  end

  def random
    if authorize_apikey
      @movie = Movie.random
      json_response(@movie)
    else
      json_response({:message => "Use an apikey for access"})
    end
  end

  def longest
    if authorize_apikey
      @movie = Movie.longest
      json_response(@movie)
    else
      json_response({:message => "Use an apikey for access"})
    end
  end

  def rating
    if authorize_apikey
      @movie = Movie.rating
      json_response(@movie)
    else
      json_response({:message => "Use an apikey for access"})
    end
  end

  def popular
    if authorize_apikey
      @movie = Movie.popular
      json_response(@movie)
    else
      json_response({:message => "Use an apikey for access"})
    end
  end

  def letter
    if authorize_apikey
      letter = params[:letter]
      @movies = Movie.title_by_letter(letter)
      json_response(@movies)
    else
      json_response({:message => "Use an apikey for access"})
    end
  end

  def year_released
    if authorize_apikey
      year = params[:year]
      @movies = Movie.year_released(year)
      json_response(@movies)
    else
      json_response({:message => "Use an apikey for access"})
    end
  end

  def title
    if authorize_apikey
      title = params[:title]
      @movies = Movie.partial_title(title)
      json_response(@movies)
    else
      json_response({:message => "Use an apikey for access"})
    end
  end

  def test
    binding.pry

  end



  def authorize_apikey
    if params["apikey"] && Token.find_by_token_hash(params["apikey"])
      true
    else
      false
    end
  end

end
