# == Schema Information
#
# Table name: nominees
#
#  id            :integer          not null, primary key
#  ballots_count :integer
#  category      :string
#  ceremony_year :integer
#  nom_name      :string
#  winner        :boolean
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
class Nominee < ApplicationRecord
  has_many(:ballots, { :class_name => "Ballot", :foreign_key => "actor_id", :dependent => :destroy })


end
