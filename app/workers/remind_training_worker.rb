require 'sidekiq-scheduler'

class RemindTrainingWorker
  include Sidekiq::Worker
  def perform
    TrainingSession.where(dictation_date: Time.zone.tomorrow).each do |training_session|
      TrainingSessionMailer.training_reminder(training_session.id).deliver_later
    end
  end
end