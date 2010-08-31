class Totaldefense < ActiveRecord::Base

  def relative_rank(stat)

    maxstat = eval("Totaldefense.maximum(:#{stat})")
    minstat = eval("Totaldefense.minimum(:#{stat})")
    rank = eval("(maxstat - self.#{stat} ) / (maxstat -minstat)")


    eval("self.#{stat}rr = rank")
    self.save
   end

end

