class Userweight

  attr_accessor :winweight, :ypgweight, :yppweight, :tdweight,
                :dypgweight, :dyppweight, :dtdweight,
                :error



  def initialize(userweight)
    @winweight = userweight[:winweight]
    @ypgweight = userweight[:ypgweight]
    @yppweight = userweight[:yppweight]
    @tdweight  = userweight[:tdweight]

    @dypgweight = userweight[:dypgweight]
    @dyppweight = userweight[:dyppweight]
    @dtdweight = userweight[:dtdweight]

    @error = userweight[:error]
  end


  def scorecalc(weights, stats)
    weights.userscore = ((weights.winweight / 100) * stats.winpct) +
                        ((weights.ypgweight / 100) * stats.yardspergamerr) +
                        ((weights.yppweight / 100) * stats.yardsperplayrr) +
                        ((weights.tdweight / 100) * stats.touchdownspergamerr)
  end

end

