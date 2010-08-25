class PagesController < ApplicationController

  def home
    @allteams = Totaloffense.find(:all, :order => 'yardspergame DESC')
    totals = 0
  end
end

