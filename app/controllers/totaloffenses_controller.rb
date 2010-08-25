class TotaloffensesController < ApplicationController

  def home
    @allteams = Totaloffense.all
  end

  def relative_rank
    @teamranked = Totaloffense.(params[:stat])
    maxstat = Totaloffense.maximum(stat)
    minstat = Totaloffense.minimum(stat)
    @teamranked.yardspergamerr = (@teamranked.yardspergame - minstat) /
                                 (maxstat - minstat)
  end

end

