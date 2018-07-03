class Wiki < ActiveRecord::Base
  belongs_to :user
  
  before_save { self.private ||= false; true } 
  
  validates :user, presence: true
  
  def publicize
    update_attribute(:private, false)
  end
end
