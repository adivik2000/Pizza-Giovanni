# == Schema Information
# Schema version: 20101201004024
#
# Table name: users
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  email      :string(255)
#  phone      :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class User < ActiveRecord::Base
  attr_accessible :name, :email, :phone
  
  email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :name, :length   => { :maximum => 90 }
              
  validates :email, :format   => { :with => email_regex },
                    :uniqueness => { :case_sensitive => false }                                           
end
