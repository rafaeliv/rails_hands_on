class Gtalk < Address
  validates_format_of :name, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i

  before_create :set_kind
  before_save :downcase_name
  
  def set_kind
    self.kind = ON_LINE
  end
  
  def downcase_name
    self.name = self.name.downcase
  end


end