class TrainingSessionMailer < ApplicationMailer
  
  def training_reminder(training_session_id)
  	@training_session = TrainingSession.find(training_session_id)
  	@training = @training_session.training
  	user_recepients = User.where(id: @training_session.invitations.pluck(:user_id)).pluck(:email).join(",")
  	mail(to: user_recepients, subject: "[#{@training.name}] Recordatorio")
  end
end
