module API
    class AlertRankingsController < API::ApiController
        load_and_authorize_resource param_method: :ranking_params
        before_action :get_alert
        skip_before_action :authenticate_with_token!, :only => [:index, :show]
        
        def index
           render json: @alert.alert_rankings.all, status: :ok
        end
        
        def show
            render json: @alert_ranking, status: :ok
        end
        
        def create
            alert_ranking = @alert.alert_rankings.new(ranking_params)
            alert_ranking.user_id = current_user.id
            if alert_ranking.save
                render json: alert_ranking, status: :created, location: [:api, alert_ranking]
            else
                render json: alert_ranking.errors, status: :unprocessable_entity
            end
        end
        
        def update
            if @alert_ranking.update(ranking_params)
                render json: @alert_ranking, status: :ok, location: [:api, @alert_ranking]
            else
                render json: @alert_ranking.errors, status: :unprocessable_entity
            end
        end
        
        def destroy
            @alert_ranking.destroy
            head :no_content
        end
        
        private
        def get_alert
            @alert = Alert.find_by_id(params[:alert_id])
        end
        
        def ranking_params
            params.require(:alert_ranking).permit(:ranking)
        end
    end
end