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
        record.winpct = (record.wins + (record.ties / 2) ) / record.games
        record.touchdownspergame = (record.touchdowns / record.games)
      record.save
      end
    end


  task :relative_rank => :environment # load Rails environmen
  task :relative_rank do
    Totaloffense.all.each do |team|

     team.relative_rank("yardspergame")
     team.relative_rank("yardsperplay")
     team.relative_rank("touchdowns")
     team.relative_rank("touchdownspergame")

    end
  end

end

