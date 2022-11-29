class ActivitiesController < ApplicationController
    def index
        render json: Activity.all
    end

    def destroy
        Activity.find(params[:id]).destroy
        head :no_content
    rescue ActiveRecord::RecordNotFound
        render_not_found_response
    end

    private

    def render_not_found_response
        render json: { error: "Activity not found" }, status: :not_found
    end
end
