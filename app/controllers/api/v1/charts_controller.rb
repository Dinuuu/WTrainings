module Api
  module V1
    class ChartsController < ApiController
      before_action :set_default_month

      def trainings_per_month
        render json: TrainingSession.finished.group_by_month(:dictation_date, format: "%b %Y").count
      end

      def trainings_per_type
        render json: TrainingSession.joins(:training).finished
                                    .where('extract(month from training_sessions.dictation_date) = ?',
                                           Date::MONTHNAMES.find_index(monthly_info[:month]))
                                    .group('trainings.kind').count
      end

      def monthly_info
        render json: MonthlyInfo.call(monthly_info).result
      end

      private
      
      def set_default_month
        params[:month] ||= Time.zone.now.strftime("%B")
      end

      def monthly_info
        params.permit(:month)
      end
    end
  end
end