class Twitter < Address
  
  before_create :set_kind
  
  def set_kind
    self.kind = OFF_LINE
  end
  
end