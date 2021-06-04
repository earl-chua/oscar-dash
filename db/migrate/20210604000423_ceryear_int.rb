class CeryearInt < ActiveRecord::Migration[6.0]
  def change
    change_column :nominees, :ceremony_year, :integer
    change_column :ballots, :ceremony_year, :integer
  end
end
