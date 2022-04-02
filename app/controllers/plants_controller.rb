class PlantsController < ApplicationController

    def index
        plants = Plant.all
        render json: plants
    end

    def show 
        plant = Plant.find_by(id: params[:id])
        if plant
            render json: plant, status: :ok
        else 
            render json: { error: "Plant not found"}, status: :not_found
        end
    end

    def create
        plant = Plant.create(plant_params)
        if plant
            render json: plant, status: :created
        else
            render json: { error: "Plant was not created. Please double-check submission information"}, status: :error
        end
    end

    private

    def plant_params
        params.permit(:name, :image, :price)
    end


end
