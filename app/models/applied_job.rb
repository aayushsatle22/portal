class AppliedJob < ApplicationRecord
	belongs_to :user
	belongs_to :job
	#validates :contactno,:name,:surname,:user_id,:job_id,:email,:experience, presence: true
end
