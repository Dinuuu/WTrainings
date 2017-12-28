module Api
  module V1
    class ChartsController < ApiController

      def trainings_per_month
        render json: TrainingSession.finished.group_by_month(:dictation_date, format: "%b %Y").count
      end
    end
  end
end