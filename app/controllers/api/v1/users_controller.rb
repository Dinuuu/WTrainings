module Api
    module V1
      class UsersController < ApiController
  
        def info
          render json: UserInfo.call(filter_params.merge(user_id: User.find_by_email(params[:id]).id)).result
        end
  
        
  
        def summary_info
          render json: InfoSummary.call(filter_params).result
        end

      end
    end
  end