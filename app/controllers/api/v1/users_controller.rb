module Api
  module V1
    class UsersController < ApiController

      def index
        render json: UsersQuery.new.find(filter_params).map { |user| { name: user.name, id: user.id } }
      end

      def trainings_assisted
        render json: TrainingSessionQuery.new.find(filter_training_params.merge(user_id: params[:id]))
                      .joins(:training).pluck_to_hash('trainings.name as training_name, dictation_date')
      end

      private

      def search_params
        params.permit(:query)
      end

      def filter_training_params
        params.permit(:date, :year, :after_date, :type)
      end
    end
  end
end