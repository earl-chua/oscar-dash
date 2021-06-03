# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  ballots_count   :integer
#  email           :string
#  password_digest :string
#  username        :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
class User < ApplicationRecord
  validates :email, :uniqueness => { :case_sensitive => false }
  validates :email, :presence => true
  has_secure_password

  has_many(:ballots, { :class_name => "Ballot", :foreign_key => "user_id", :dependent => :destroy })
end
