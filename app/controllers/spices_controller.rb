class SpicesController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
    #IN OWN FILE, config->wrap # wrap_parameters format: []

    def index
        spices = Spice.all 
        render json: spices 
    end

    # def show
    #     render json: spice, status: :found 
    # end

    def create
        spice = Spice.create(spice_params)
        render json: spice, status: :created 
    end

    def update
        spice.update(spice_params)
        render json: spice, status: :accepted
    end

    def destroy
        spice.destroy
        head :no_content
    end


    private

    def spice
        Spice.find(params[:id])
    end

    def render_not_found_response
        render json: { error: "Spice not found" }, status: :not_found 
    end

    def spice_params
        params.permit(:title, :image, :notes, :description, :rating)
    end

end
