class CampersController < ApplicationController
    def index
        render json: Camper.all
    end

    def show
        camper = Camper.find(params[:id])
        render json: camper, serializer: CamperActivitiesSerializer
    rescue ActiveRecord::RecordNotFound
        render json: { error: "Camper not found" }, status: :not_found
    end
    
    def create
        camper = Camper.create!(camper_params)
        render json: camper, status: :created
    rescue ActiveRecord::RecordInvalid => invalid
        render json: { errors: invalid.record.errors.full_messages }, status: :unprocessable_entity
    end

    private

    def camper_params
        params.permit(:name, :age)
    end

    # def render_not_found_response
        # render json: { error: "Camper not found" }, status: :not_found
    # end

    # def render_unprocessable_entity_response(invalid)
    #     render json: { errors: invalid.record.errors }, status: :unprocessable_entity
    # end
end
