class AppliedJob < ApplicationRecord
	belongs_to :user
	belongs_to :job
	#validates :contactno,:name,:surname,:user_id,:email,:experience, presence: true
	 has_one_attached :resume
end
