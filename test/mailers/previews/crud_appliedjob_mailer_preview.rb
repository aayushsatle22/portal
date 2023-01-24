# Preview all emails at http://localhost:3000/rails/mailers/crud_appliedjob_mailer
class CrudAppliedjobMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/crud_appliedjob_mailer/create_notification
  def create_notification
    CrudAppliedjobMailer.create_notification
  end

  # Preview this email at http://localhost:3000/rails/mailers/crud_appliedjob_mailer/update_notification
  def update_notification
    CrudAppliedjobMailer.update_notification
  end

  # Preview this email at http://localhost:3000/rails/mailers/crud_appliedjob_mailer/delete_notification
  def delete_notification
    CrudAppliedjobMailer.delete_notification
  end

end
