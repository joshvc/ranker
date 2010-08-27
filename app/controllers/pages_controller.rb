class PagesController < ApplicationController

  def data
    @allteams = Totaloffense.find(:all, :order => 'yardspergame DESC')
    totals = 0
  end

  def new
   @userweight = Userweight.new

  end

  def create

   @userweight = Userweight.new(params[:userweight])
   @userweight.save
   redirect_to("output")

  end

  def output



    Totaloffense.all.each do |stats|
      session[:teamtable] = {:team => stats.team,
                      :score => (((@userweight.winweight / 100) * stats.winpct) +
                        ((weight.ypgweight / 100) * stats.yardspergamerr) +
                        ((weight.yppweight / 100) * stats.yardsperplayrr) +
                        ((weight.tdweight / 100) * stats.touchdownspergamerr)) }
    end
  end
end

