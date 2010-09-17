require 'fastercsv'



namespace :db do
  desc "Fill database from csv file"
  task :populate => :environment do

    Rake::Task['db:reset'].invoke
    FasterCSV.foreach("rushingoffense.csv") do |row|
      record = Rushingoffense.new(
        :team => row[0],
        :rogames => row[1],
        :rushcarries => row[2],
        :rushtotal => row[3],
        :rushyardsperplay => row[4],
        :rushtouchdowns => row[5],
        :rushyardspergame => row[6]

      )
        record.rushtouchdownspergame = (record.rushtouchdowns / record.rogames)
      record.save
    end


  end


  task :relative_rank => :environment # load Rails environmen
  task :relative_rank do
    Rushingoffense.all.each do |team|

     team.relative_rank("rushyardspergame")
     team.relative_rank("rushyardsperplay")
     team.relative_rank("rushtouchdownspergame")

    end
  end
end

