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
   session[:userweight] = @userweight


   redirect_to :action => :output

  end

  def output

  @userweight = session[:userweight]
  @teamtable = []
    Totaloffense.all.each do |stats|
      @teamtable << {:team => stats.team,
                      :score => (((@userweight.winweight.to_f / 100) * stats.winpct) +
                        ((@userweight.ypgweight.to_f / 100) * stats.yardspergamerr) +
                        ((@userweight.yppweight.to_f / 100) * stats.yardsperplayrr) +
                        ((@userweight.tdweight.to_f / 100) * stats.touchdownspergamerr)) }
    end

  @teamtable.sort! { |b,a| a[:score] <=> b[:score] }




  end
end

