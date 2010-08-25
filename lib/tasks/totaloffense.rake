require 'fastercsv'

namespace :db do
  desc "Fill database from csv file"
  task :populate => :environment do
    Rake::Task['db:reset'].invoke
    FasterCSV.foreach("totaloffense.csv") do |row|
      record = Totaloffense.new(
        :team => row[0],
        :games => row[1],
        :plays => row[2],
        :yards => row[3],
        :yardsperplay => row[4],
        :touchdowns => row[5],
        :yardspergame => row[6],
        :wins => row[7],
        :losses => row[8],
        :ties => row[9]
      )
        record.winpct = (record.wins.to_f + (record.ties.to_f / 2) ) / record.games.to_f
      record.save
      end

# want to perform a method relative_rank on yardsperplay, yardspergame, tds
# ie, yardsperplayrr = relative_rank(yardsperplay)


        maxyardspg = Totaloffense.maximum('yardspergame')
        minyardspg = Totaloffense.minimum('yardspergame')

      Totaloffense.all.each do |teams|

        teams.yardspergamerr = (teams.yardspergame - minyardspg) / (maxyardspg - minyardspg)
        teams.save
        end
    end
end

