class Address < ActiveRecord::Base
  include StiExtensions

  AVAILABLE_TYPES=[['Twitter','Twitter'],['Gtalk','Gtalk'],['Jabber','Jabber']]

  validates_presence_of :name

  belongs_to :contact
end
