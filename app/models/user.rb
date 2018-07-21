class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :wikis, dependent: :destroy
  has_many :collaborators, dependent: :destroy
  
 def going_public
   self.wikis.each { |wiki| puts wiki.publicize }
 end
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable
         
  before_save { self.role ||= :standard } 
         
  enum role: [:standard, :premium, :admin]
end
