class Userweight

  def home
    @userweight = Userweight.new
  end

  def create
    @userweight = Userweight.new(params[:userweight])
  end

end

