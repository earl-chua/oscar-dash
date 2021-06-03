namespace :slurp do
  desc "TODO"
  task the_oscars_abridged: :environment do
  
  require "csv"

  oscars_b8_data = File.read(Rails.root.join("lib","csvs","the_oscars_abridged.csv"))
  #puts oscars_b8_data

  csv = CSV.parse(oscars_b8_data, :headers => true, :encoding => "ISO-8859-1")
  #puts csv

  csv.each do |row|
    n = Nominee.new
    n.category = row["category"]
    n.ceremony_year = row["ceremony_year"]
    n.winner = row["winner"]

    people_cat = ["ACTOR","ACTRESS","ACTOR IN A LEADING ROLE", "ACTRESS IN A LEADING ROLE","ACTOR IN A SUPPORTING ROLE", "ACTRESS IN A SUPPORTING ROLE","DIRECTING","DIRECTING (Comedy Picture)","DIRECTING (Drama Picture)"]
    if people_cat.include? row["category"] then
      n.nom_name = row["nominee"] + " - " + row["film"]
    else
      n.nom_name = row["film"]
    end
    n.save
  end

  
  
  puts "There are now #{Nominee.count} rows in the nominees table"
  
  
  end

end
