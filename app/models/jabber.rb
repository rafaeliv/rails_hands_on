class Jabber < Address

  before_create :set_kind
  
  def set_kind
    self.kind = ON_LINE
  end


end
