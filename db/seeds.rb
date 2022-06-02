require 'csv'

CSV.foreach(Rails.root.join('lib/seed_csv/pokemon.csv'), headers: true) do |row|
  Pokemon.create( {
    number: row["#"], 
    name: row["Name"],
    type1: row["Type 1"], 
    type2: row["Type 2"],
    total: row["Total"],
    hp: row["HP"],
    attack: row["Attack"],
    defense: row["Defense"],
    spatk: row["Sp. Atk"],
    spdef: row["Sp. Def"],
    speed: row["Speed"],
    generation: row["Generation"],
    legendary: row["Legendary"]
  } ) 
end