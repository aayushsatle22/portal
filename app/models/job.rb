class Job < ApplicationRecord
	validates :title,:jobtype,:salary,:location, :description,presence: { message: "can't be blank" }
	belongs_to :user	
end
