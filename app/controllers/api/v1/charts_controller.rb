module Api
  module V1
    class ChartsController < ApiController

      def trainings_per_month
        render json: TrainingSessionQuery.new.find(filter_params)
                      .group_by_month(:dictation_date, format: "%b %Y").count
      end

      def trainings_per_type
        render json: TrainingSessionQuery.new.find(filter_params)
                      .joins(:training)
                      .group('trainings.kind').count.transform_keys! { |kind| Training.kinds.key(kind) }
      end

      def summary_info
        render json: InfoSummary.call(filter_params).result
      end

      def trainings_attendance
        render json: InvitationsQuery.new.find(filter_params).group(:attended)
                                     .count.transform_keys! { |attendance| attendance ? 'present' : 'absent' }
      end

      private

      def filter_params
        params.permit(:date, :year, :user_id, :after_date, :type)
      end
    end
  end
end