class ApplicantsController < ApplicationController
	def index
    @jobs = Job.all
    end
   def show
    @job = Job.find(params[:id]) 
      AppliedJob.create(job_id: @job.id,user_id: current_user.id)
   end
   
end
