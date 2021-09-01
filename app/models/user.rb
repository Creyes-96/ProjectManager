class User < ApplicationRecord
  has_many :projects
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  validates :first_name, presence: true, allow_blank: false
  validates :last_name, presence: true, allow_blank: false
  validates :username, presence: true, allow_blank: false
  validates :email, presence: true, allow_blank: false
  validates :privilege, presence: true, allow_blank: false
  validates :password, presence: true, allow_blank: false
  validates :password_confirmation, presence: true, allow_blank: false
 

  
        
end
