class AppliedJobsController < ApplicationController
   
  def index
    #@jobs = Job.all
    @q = Job.ransack(params[:q])
    @jobs = @q.result(distinct:true)
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
    @applied_job.resume.attach(params[:applied_job][:resume])   
      if AppliedJob.exists?(user_id: params[:applied_job][:user_id], job_id: params[:applied_job][:job_id])
         flash[:error] = "you have  already applied for this  Job"
         render :new
      elsif @applied_job.save
       CrudAppliedjobMailer.create_notification(@applied_job,current_user).deliver_later
       redirect_to display_applied_jobs_path
      else
       render :new  
      end
   end

  def display
  end

  def myjob
    @job_ids = AppliedJob.where(user_id:current_user.id).pluck(:job_id)
    @jobs=Job.where(id: @job_ids)
  end


   private
   def applied_job_params
      params.require(:applied_job).permit(:job_id,:user_id,:name,:surname,:email,:contactno,:experience ,:resume)
   end
end
