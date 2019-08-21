class MoviesController < ApplicationController

  def index
    if authorize_token
      @movies = Movie.all.order("title ASC").offset(0).limit(1000)
      json_response(@movies)
    else
      json_response({:message => "Use a token for access"})
    end
  end

  def show
    if authorize_token
      movie_id = params[:id]
      @movie = Movie.find(movie_id)
      json_response(@movie)
    else
      json_response({:message => "Use a token for access"})
    end
  end

  def random
    if authorize_token
      @movie = Movie.random
      json_response(@movie)
    else
      json_response({:message => "Use a token for access"})
    end
  end

  def longest
    if authorize_token
      @movie = Movie.longest
      json_response(@movie)
    else
      json_response({:message => "Use a token for access"})
    end
  end

  def rating
    if authorize_token
      @movie = Movie.rating
      json_response(@movie)
    else
      json_response({:message => "Use a token for access"})
    end
  end

  def popular
    if authorize_token
      @movie = Movie.popular
      json_response(@movie)
    else
      json_response({:message => "Use a token for access"})
    end
  end

  def letter
    if authorize_token
      letter = params[:letter]
      @movies = Movie.title_by_letter(letter)
      json_response(@movies)
    else
      json_response({:message => "Use a token for access"})
    end
  end



  def authorize_token
    if params[:token] && Token.find_by_token_hash(params[:token])
      true
    else
      false
    end
  end

end
