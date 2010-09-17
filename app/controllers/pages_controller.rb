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

     debugger
     redirect_to :action => :output
#   else
#     session[:error] = "Inputs do not equal 100 Percent"
#    redirect_to root_path

#   end

  end

  def output

   @userweight = session[:userweight]
   @totalpoints = (@userweight.winweight.to_f + @userweight.ypgweight.to_f +
     @userweight.yppweight.to_f + @userweight.tdweight.to_f +
     @userweight.dypgweight.to_f + @userweight.dyppweight.to_f +
     @userweight.dtdweight.to_f)

  ["winweight", "ypgweight", "yppweight", "yppweight", "tdweight", "dypgweight", "dyppweight",
    "dtdweight"].each do |reweight|
      eval("@userweight.#{reweight} = @userweight.#{reweight}.to_f / @totalpoints")
    end


  @teamtable = []
    Totaloffense.all.each do |stats|
      @teamd = Totaldefense.find_by_team(stats.team)
      @teamtable << {:team => stats.team,
                      :score => (((@userweight.winweight.to_f ) * stats.winpct) +
                        ((@userweight.ypgweight.to_f ) * stats.yardspergamerr) +
                        ((@userweight.yppweight.to_f ) * stats.yardsperplayrr) +
                        ((@userweight.tdweight.to_f ) * stats.touchdownspergamerr)+
                        ((@userweight.dypgweight.to_f ) * @teamd.dyardspergamerr) +
                        ((@userweight.dyppweight.to_f ) * @teamd.dyardsperplayrr) +
                        ((@userweight.dtdweight.to_f ) * @teamd.dtouchdownspergamerr)
                        #add a + and put new weight lines here
                        ) }
    end

  @teamtable.sort! { |b,a| a[:score] <=> b[:score] }




  end
end

