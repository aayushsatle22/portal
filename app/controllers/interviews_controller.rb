class InterviewsController < ApplicationController
	  def show
      @interview = Interview.find(params[:id])
     # @interview = Interview.find_by(user_id: params[:user_id], job_id: params[:job_id])

    end
    def edit
        @interview = Interview.find(params[:id])  
    end

    def update
        @interview = Interview.find(params[:id])
        if @interview.update(interview_params)
          redirect_to @interview, notice: "Interview status updated successfully."
        else
          render :edit
        end
      end

    def new 
       @interview = Interview.new
        @user_id = params[:user_id]
        @job_id = params[:job_id]
    end
    def create
      @interview = Interview.new(interview_params)

      if Interview.exists?(user_id: params[:interview][:user_id], job_id: params[:interview][:job_id])
        flash[:error] = "Interview already exists for this User and Job"
        render :new

      elsif @interview.save
        CrudAppliedjobMailer.interview_notification(@interview).deliver_later
        redirect_to interview_path(@interview)
      else
        render :new
      end
    end
    
      private
       def interview_params
        params.require(:interview).permit(:address,:date,:user_id,:job_id,:status)
      end
end
