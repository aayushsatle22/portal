class Interview < ApplicationRecord
	belongs_to :user
	belongs_to :job
	validates :date,:address,presence: { message: "can't be blank" }
end
