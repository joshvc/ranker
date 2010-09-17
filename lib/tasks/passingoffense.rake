require 'fastercsv'



namespace :db do
  desc "Fill database from csv file"
  task :populate => :environment do

    Rake::Task['db:reset'].invoke
    FasterCSV.foreach("passingoffense.csv") do |row|
      record = Passingoffense.new(
        :team => row[0],
        :pogames => row[1],
        :passattempts => row[2],
        :passcompletions => row[3],
        :passinterceptions => row[4],
        :passpercentage => row[5],
        :passyards => row[6],
        :passyardsperattempt => row[7],
        :passtouchdowns => row[8],
        :passyardspergame => row[9],
        :passinterceptionspct => row[10],
        :passyardspercompletion => row[11]

      )
        record.passtouchdownspergame = (record.passtouchdowns / record.pogames)
        record.passinterceptionspergame = (record.passinterceptions  / record.pogames)
      record.save
    end


  end

  task :relative_rank => :environment # load Rails environmen
  task :relative_rank do
    Passingoffense.all.each do |team|

     team.relative_rank("passyardsperattempt")
     team.relative_rank("passtouchdownspergame")
     team.relative_rank("passyardspergame")
     team.relative_rank("passinterceptionspct")
     team.relative_rank("passyardspercompletion")

    end
  end

end

