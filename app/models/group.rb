class Group < ActiveRecord::Base
  has_many :contacts, :through => :relationships
  has_many :relationships
end
