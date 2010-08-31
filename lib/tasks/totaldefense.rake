require 'fastercsv'



namespace :db do
  desc "Fill database from csv file"
  task :populate => :environment do

    Rake::Task['db:reset'].invoke

    FasterCSV.foreach("totaldefense.csv") do |row|
      record = Totaldefense.new(
        :team => row[0],
        :dgames => row[1],
        :dplays => row[2],
        :dyards => row[3],
        :dyardsperplay => row[4],
        :dtouchdowns => row[5],
        :dyardspergame => row[6]
        )

        record.dtouchdownspergame = (record.dtouchdowns / record.dgames)
        record.save
      end
    end


  task :relative_rank => :environment # load Rails environmen
  task :relative_rank do
    Totaldefense.all.each do |team|

     team.relative_rank("dyardspergame")
     team.relative_rank("dyardsperplay")
     #team.relative_rank("touchdowns")
     team.relative_rank("dtouchdownspergame")

    end
  end
  end

