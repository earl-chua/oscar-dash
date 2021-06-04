# == Schema Information
#
# Table name: ballots
#
#  id              :integer          not null, primary key
#  ceremony_year   :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  a_screenplay_id :integer
#  actor_id        :integer
#  actress_id      :integer
#  director_id     :integer
#  o_screenplay_id :integer
#  picture_id      :integer
#  s_actor_id      :integer
#  s_actress_id    :integer
#  user_id         :integer
#
class Ballot < ApplicationRecord
  belongs_to(:user, { :required => false, :class_name => "User", :foreign_key => "user_id", :counter_cache => true })
  belongs_to(:actor, { :required => false, :class_name => "Nominee", :foreign_key => "actor_id", :counter_cache => true })
  belongs_to(:actor, { :required => false, :class_name => "Nominee", :foreign_key => "actress_id", :counter_cache => true })
  belongs_to(:actor, { :required => false, :class_name => "Nominee", :foreign_key => "s_actor_id", :counter_cache => true })
  belongs_to(:actor, { :required => false, :class_name => "Nominee", :foreign_key => "s_actress_id", :counter_cache => true })
  belongs_to(:actor, { :required => false, :class_name => "Nominee", :foreign_key => "director", :counter_cache => true })
  belongs_to(:actor, { :required => false, :class_name => "Nominee", :foreign_key => "o_screenplay_id", :counter_cache => true })
  belongs_to(:actor, { :required => false, :class_name => "Nominee", :foreign_key => "a_screenplay_id", :counter_cache => true })
  belongs_to(:actor, { :required => false, :class_name => "Nominee", :foreign_key => "picture_id", :counter_cache => true })

def username

end

def score
   
end

end
