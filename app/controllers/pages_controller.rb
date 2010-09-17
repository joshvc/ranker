class PagesController < ApplicationController

  def data
    @allteams = Totaloffense.find(:all, :order => 'yardspergame DESC')
    totals = 0
  end

  def home
    @error = session[:error]
  end


    def new
     @userweight = Userweight.new

    end

  def create

   @userweight = Userweight.new(params[:userweight])
   if
    (@userweight.winweight.to_f + @userweight.ypgweight.to_f +
     @userweight.yppweight.to_f + @userweight.tdweight.to_f +
     @userweight.dypgweight.to_f + @userweight.dyppweight.to_f +
     @userweight.dtdweight.to_f) == 100

     session[:userweight] = @userweight
     redirect_to :action => :output
   else
     session[:error] = "Inputs do not equal 100 Percent"
    redirect_to root_path

   end

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

