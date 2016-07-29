class WelcomeController < ApplicationController
  def index
    @urls = Url.all
  end
end
