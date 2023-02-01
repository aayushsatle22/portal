class JobsController < ApplicationController
	def index
    if current_user.role == 'admin'
       @jobs = Job.all
    else 
     @jobs = Job.where(user_id: current_user.id)
    end
  end
  def show
    @job = Job.find(params[:id])
  end
  def new
    @job = Job.new
  end
  def edit
  @job = Job.find(params[:id])
  end
  def create
    # binding.pry
  @job = Job.new(job_params.merge(user_id: current_user.id))
 
  if @job.save
    redirect_to @job
  else
    
    render 'new'
  end
 end
  def update
  @job = Job.find(params[:id])
 
  if @job.update(job_params)
    redirect_to @job
  else
    render 'edit'
  end
 end
 def destroy
  @job = Job.find(params[:id])
  @job.destroy
 
  redirect_to jobs_path
  end
  def all_user
     @all_user = User.where(role: 'user')
   end
   def applicant
   if current_user.role == "admin"
    @applied_jobs = AppliedJob.joins(:job).select("applied_jobs.*, jobs.title")
   else 
   # @applied_jobs = AppliedJob.joins(:job).select("applied_jobs.*, jobs.title").where(user_id: current_user.id)
   @applied_jobs = AppliedJob.joins(:job).where(jobs: { user_id: current_user.id }).select("applied_jobs.*, jobs.title")

   end

   end
private
  def job_params
    params.require(:job).permit(:title, :jobtype, :salary, :location, :description)

  end
end

