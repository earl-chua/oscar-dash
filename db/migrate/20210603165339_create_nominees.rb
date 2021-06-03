class CreateNominees < ActiveRecord::Migration[6.0]
  def change
    create_table :nominees do |t|
      t.string :nom_name
      t.datetime :ceremony_year
      t.string :category
      t.boolean :winner
      t.integer :ballots_count

      t.timestamps
    end
  end
end
