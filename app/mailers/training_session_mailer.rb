class TrainingSessionMailer < ApplicationMailer
  
  def training_reminder(training_session_id)
    @training_session = TrainingSession.find(training_session_id)
    @training = @training_session.training
    user_recepients = User.where(id: @training_session.invitations.pluck(:user_id)).pluck(:email)
    mail(to: user_recepients, subject: "[#{@training.name}] Recordatorio")
  end

  def send_feedback_request(training_session_id)
    training_session = TrainingSession.find(training_session_id)
    @training = training_session.training
    user_recepients = User.where(id: training_session.invitations.attended.pluck(:user_id)).pluck(:email)
    mail(to: user_recepients, subject: "[#{@training.name}] ¡Contanos qué te pareció el Training!")
  end

  def send_coudlnt_assist_feedback_request(training_session_id)
    training_session = TrainingSession.find(training_session_id)
    @training = training_session.training
    @feeback_form = Rails.application.secrets.couldnt_assist_feedback_form
    user_recepients = User.where(id: training_session.invitations.not_attended.pluck(:user_id)).pluck(:email)
    mail(to: user_recepients, subject: "[#{@training.name}] ¡Ayudanos a mejorar!")
  end

  def send_admin_reminder(training_session_id)
    @training_session = TrainingSession.find(training_session_id)
    training = @training_session.training
    mail(to: Rails.application.secrets.admin_emails, subject: "[#{training.name}] ¡No se enviaron Feedbacks!")
  end
end
