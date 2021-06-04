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
  belongs_to(:actress, { :required => false, :class_name => "Nominee", :foreign_key => "actress_id", :counter_cache => true })
  belongs_to(:s_actor, { :required => false, :class_name => "Nominee", :foreign_key => "s_actor_id", :counter_cache => true })
  belongs_to(:s_actress, { :required => false, :class_name => "Nominee", :foreign_key => "s_actress_id", :counter_cache => true })
  belongs_to(:director, { :required => false, :class_name => "Nominee", :foreign_key => "director", :counter_cache => true })
  belongs_to(:o_screenplay, { :required => false, :class_name => "Nominee", :foreign_key => "o_screenplay_id", :counter_cache => true })
  belongs_to(:a_screenplay, { :required => false, :class_name => "Nominee", :foreign_key => "a_screenplay_id", :counter_cache => true })
  belongs_to(:picture, { :required => false, :class_name => "Nominee", :foreign_key => "picture_id", :counter_cache => true })

def username
  name = User.where({ :id => self.user_id }).first.username  
  return name
end

def best_actor
   name = Nominee.where({ :id => self.actor_id }).first.nom_name
end

def best_actress
   name = Nominee.where({ :id => self.actress_id }).first.nom_name
end

def best_s_actor
   name = Nominee.where({ :id => self.s_actor_id }).first.nom_name
end

def best_s_actress
   name = Nominee.where({ :id => self.s_actress_id }).first.nom_name
end

def best_director
   name = Nominee.where({ :id => self.director_id }).first.nom_name
end

def best_o_screenplay
   name = Nominee.where({ :id => self.o_screenplay_id }).first.nom_name
end

def best_a_screenplay
   name = Nominee.where({ :id => self.a_screenplay_id }).first.nom_name
end

def best_picture
   name = Nominee.where({ :id => self.picture_id }).first.nom_name
end

def score
  tot = Array.new
  tot.push(Nominee.where({ :id => self.actor_id }).first.winner)
  tot.push(Nominee.where({ :id => self.actress_id }).first.winner)
  tot.push(Nominee.where({ :id => self.s_actor_id }).first.winner)
  tot.push(Nominee.where({ :id => self.s_actress_id }).first.winner)
  tot.push(Nominee.where({ :id => self.director_id }).first.winner)
  tot.push(Nominee.where({ :id => self.o_screenplay_id }).first.winner)
  tot.push(Nominee.where({ :id => self.a_screenplay_id }).first.winner)
  tot.push(Nominee.where({ :id => self.picture_id }).first.winner)
  return tot.count(true)/8.0
end

end