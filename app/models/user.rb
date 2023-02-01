class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

   validates :name,:role,:password_confirmation, presence: { message: "can't be blank" }
    has_many :applied_jobs  
    has_many :jobs   
end
