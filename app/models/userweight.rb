class Userweight

  attr_accessor :winweight, :ypgweight, :yppweight, :tdweight, :userscore

  def scorecalc(weights, stats)
    weights.userscore = ((weights.winweight / 100) * stats.winpct) +
                        ((weights.ypgweight / 100) * stats.yardspergamerr) +
                        ((weights.yppweight / 100) * stats.yardsperplayrr) +
                        ((weights.tdweight / 100) * stats.touchdownspergamerr)
  end

end

