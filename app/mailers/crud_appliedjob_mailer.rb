class CrudAppliedjobMailer < ApplicationMailer

  
  def create_notification(object,current_user)
    @object = object
    @object_count = object.class.count 
    mail to: current_user.email ,subject: "a new entry for #{object.class} has been created"
  end

  
  def update_notification
   
  end

 
  def delete_notification
   
  end
end
