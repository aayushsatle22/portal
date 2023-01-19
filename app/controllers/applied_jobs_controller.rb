class AppliedJobsController < ApplicationController
	def index
    @jobs = Job.all
    end
   def show
    @job = Job.find(params[:id]) 
      
   end

     def new
        @job = Job.find(params[:job_id])
        @applied_job = AppliedJob.new
     end

     def create
        @applied_job = AppliedJob.new(applied_job_params)
        @applied_job.user = current_user
        if @applied_job.save
            flash[:notice] = ""
            redirect_to display_applied_jobs_path
        else
            render :new  
        end
     end
     def display
     end

     private


     def applied_job_params
        params.require(:applied_job).permit(:job_id,:user_id,:name,:surname,:email,:contactno,:experience)
     end
end
