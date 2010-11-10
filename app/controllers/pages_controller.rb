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



     session[:userweight] = @userweight


     redirect_to :action => :output
#   else
#     session[:error] = "Inputs do not equal 100 Percent"
#    redirect_to root_path

#   end

  end

  def output

   @userweight = session[:userweight]

   @totalpoints = (@userweight.ypgweight.to_f +
     @userweight.yppweight.to_f + @userweight.tdweight.to_f +
     @userweight.dypgweight.to_f + @userweight.dyppweight.to_f +
     @userweight.dtdweight.to_f)

  ["ypgweight", "yppweight", "tdweight", "dypgweight", "dyppweight",
    "dtdweight"].each do |reweight|
      eval("@userweight.#{reweight} = @userweight.#{reweight}.to_f / @totalpoints")
    end


  @teamtable = []
    Totaloffense.all.each do |stats|
      @teamd = Totaldefense.find_by_team(stats.team)
      @teamtable << {:team => stats.team,
                     :score => ((
                        ((@userweight.ypgweight.to_f ) * stats.yardspergamerr) +
                        ((@userweight.yppweight.to_f ) * stats.yardsperplayrr) +
                        ((@userweight.tdweight.to_f ) * stats.touchdownspergamerr)+
                        ((@userweight.dypgweight.to_f ) * @teamd.dyardspergamerr) +
                        ((@userweight.dyppweight.to_f ) * @teamd.dyardsperplayrr) +
                        ((@userweight.dtdweight.to_f ) * @teamd.dtouchdownspergamerr)
                        #add a + and put new weight lines here
                        ) * ((10 - @userweight.winweight.to_f) * 0.1) +
                        ((@userweight.winweight.to_f * 0.1) * (stats.winpct) )),
                     :games => stats.games,
                     :wins => stats.wins,
                     :losses => stats.losses,
                     :winpct => stats.winpct,
                     :yards => stats.yards,
                     :yardspergame => stats.yardspergame,
                     :plays => stats.plays,
                     :yardsperplay => stats.yardsperplay,
                     :touchdowns => stats.touchdowns,
                     :touchdownspergame => stats.touchdownspergame,
                     :dplays => @teamd.dplays,
                     :dyardsperplay => @teamd.dyardsperplay,
                     :dyards => @teamd.dyards,
                     :dyardspergame => @teamd.dyardspergame,
                     :dtouchdowns => @teamd.dtouchdowns,
                     :dtouchdownspergame => @teamd.dtouchdownspergame

                       }



    end


  @teamtable.sort! { |b,a| a[:score] <=> b[:score] }




  end
end

