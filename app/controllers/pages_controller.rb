class PagesController < ApplicationController

  def data
    @allteams = Totaloffense.find(:all, :order => 'yardspergame DESC')
    totals = 0
  end

  def home
    @userweight = Userweight.new
  end

  def create
    @userweight = Userweight.new(params[:userweight])
  end

end

