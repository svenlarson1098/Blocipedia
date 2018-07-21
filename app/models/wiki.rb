class Wiki < ActiveRecord::Base
  belongs_to :user
  has_many :users, through: :collaborators
  has_many :collaborators, dependent: :destroy
  
  before_save { self.private ||= false; true } 
  
  validates :user, presence: true
  
  def publicize
    update_attribute(:private, false)
  end
end
