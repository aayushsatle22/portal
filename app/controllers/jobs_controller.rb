class JobsController < ApplicationController
	require 'httparty'
	def get_data
		response = HTTParty.get("https://dummy.restapiexample.com/api/v1/employees")
		@data = JSON.parse(response.body)

		@data.each do |item|
	     Job.create(title: item["employee_name"],type: item["employee_salary"],job_description: item["employee_age"])
        end
	end

	def index
	end
end
