class CreateBallots < ActiveRecord::Migration[6.0]
  def change
    create_table :ballots do |t|
      t.datetime :ceremony_year
      t.integer :user_id
      t.integer :actor_id
      t.integer :actress_id
      t.integer :s_actor_id
      t.integer :s_actress_id
      t.integer :director_id
      t.integer :o_screenplay_id
      t.integer :a_screenplay_id
      t.integer :picture_id

      t.timestamps
    end
  end
end
