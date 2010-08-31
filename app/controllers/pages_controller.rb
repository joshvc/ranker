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
      @teamd = Totaldefense.find_by_team(stats.team)
      @teamtable << {:team => stats.team,
                      :score => (((@userweight.winweight.to_f / 100) * stats.winpct) +
                        ((@userweight.ypgweight.to_f / 100) * stats.yardspergamerr) +
                        ((@userweight.yppweight.to_f / 100) * stats.yardsperplayrr) +
                        ((@userweight.tdweight.to_f / 100) * stats.touchdownspergamerr)+
                        ((@userweight.dypgweight.to_f / 100) * @teamd.dyardspergamerr) +
                        ((@userweight.dyppweight.to_f / 100) * @teamd.dyardsperplayrr) +
                        ((@userweight.dtdweight.to_f / 100) * @teamd.dtouchdownspergamerr)
                        #add a + and put new weight lines here
                        ) }
    end

  @teamtable.sort! { |b,a| a[:score] <=> b[:score] }




  end
end

