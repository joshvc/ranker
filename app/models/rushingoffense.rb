class Rushingoffense < ActiveRecord::Base

    def relative_rank(stat)

      maxstat = eval("Rushingoffense.maximum(:#{stat})")
      minstat = eval("Rushingoffense.minimum(:#{stat})")
      rank = eval("(self.#{stat} - minstat) / (maxstat -minstat)")


      eval("self.#{stat}rr = rank")
      self.save
    end

end

