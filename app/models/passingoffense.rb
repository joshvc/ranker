class Passingoffense < ActiveRecord::Base

    def relative_rank(stat)

    maxstat = eval("Passingoffense.maximum(:#{stat})")
    minstat = eval("Passingoffense.minimum(:#{stat})")
    rank = eval("(self.#{stat} - minstat) / (maxstat -minstat)")


    eval("self.#{stat}rr = rank")
    self.save
    end

end

