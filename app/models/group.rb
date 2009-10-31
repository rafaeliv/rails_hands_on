class Group < ActiveRecord::Base
  has_many :contacts, :through => :relationships
  has_many :relationships
  has_one :assets, :as => :attachable
end
