module Api
  module V1
    class ChartsController < ApiController
      before_action :set_default_month

      def trainings_per_month
        render json: TrainingSessionQuery.new.find(filter_params).group_by_month(:dictation_date, format: "%b %Y").count
      end

      def trainings_per_type
        render json: TrainingSessionQuery.new.find(filter_params)
                      .joins(:training)
                      .group('trainings.kind').count.map { |kind, count| { Training.kinds.key(kind) => count } }
      end

      def monthly_info
        render json: MonthlyInfo.call(filter_params).result
      end

      private
      
      def set_default_month
        params[:month] ||= Time.zone.now.strftime("%B")
      end

      def filter_params
        params.permit(:month, :year)
      end
    end
  end
end