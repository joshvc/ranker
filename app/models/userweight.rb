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




end

