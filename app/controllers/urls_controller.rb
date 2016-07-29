class UrlsController < ApplicationController
  include ApplicationHelper
  def new
    @url = Url.new 
  end

  def create
    long_url = params[:url][:long_url]
    short_url = Url.generate_url
    # current_user
    
    @new_url = Url.new(long_url: long_url, short_url: short_url)

    if @new_url.save
      if current_user
        current_user.urls << @new_url
        # Recargando con ajax
        redirect_to user_path(current_user)
      else
        redirect_to :root
      end
    else
      @new_url.errors
    end
  end

  def visitando
    url_id = params[:id]
    ruta = Url.find(url_id)
    visitas = ruta.visits + 1
    ruta.update(visits: visitas )
    redirect_to ruta.long_url
    # render nothing: true
    # if redirect_to url.long_url
    #   visitas = url.visits + 1
    #   url.update(visits: visitas )
    # end
  end

  # def lala
  #   url_id = params[:id]
  #   p ruta = Url.find(url_id)
  #   puts "****************************"
  #   puts "before"
  #   visitas = ruta.visits + 1
  #   ruta.update(visits: visitas )
  #   puts "after"
  #   p ruta.visits
  #   # render nothing: true

  #   redirect_to ruta.long_url
  # end

end
