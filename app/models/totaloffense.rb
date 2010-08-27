class Totaloffense < ActiveRecord::Base

    def relative_rank(stat)

    maxstat = eval("Totaloffense.maximum(:#{stat})")
    minstat = eval("Totaloffense.minimum(:#{stat})")
    rank = eval("(self.#{stat} - minstat) / (maxstat -minstat)")


    eval("self.#{stat}rr = rank")
    self.save
    end


end

