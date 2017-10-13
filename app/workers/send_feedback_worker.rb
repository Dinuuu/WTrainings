require 'sidekiq-scheduler'

class SendFeedbackWorker
  include Sidekiq::Worker
  def perform
    TrainingSession.where(dictation_date: Time.zone.today).each do |training_session|
    	if training_session.invitations.attended.exists?
        TrainingSessionMailer.send_feedback_request(training_session.id).deliver_later
        TrainingSessionMailer.send_coudlnt_assist_feedback_request(training_session.id).deliver_later
        training_session.update_attributes(status: :finished)
      else
        TrainingSessionMailer.send_admin_reminder(training_session.id).deliver_later
      end
    end
  end
end