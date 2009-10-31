class Asset < ActiveRecord::Base
  has_attached_file :document,

  :path => ":rails_root/public/system/assets/:attachment/:id",
  :url => "/system/assets/:attachment/:id"


  belongs_to :attachable, :polymorphic => true
end
