class SpicesController < ApplicationController


    def index 
        render json: Spice.all, except: [:created_at, :updated_at]
    end

    # def show
    #     render json: Spice.find(params[:id]), except: [:created_at, :updated_at]
    # end

    def create 
        spice = Spice.create(spice_params)
        render json: spice, status: :created 
    end

    def update
        spice = Spice.find_by(id: params[:id])
        spice.update(spice_params)
        render json: spice
    end

    def destroy
        spice = Spice.find_by(id: params[:id])
        spice.destroy
        head :no_content
    end

    def spice_params
        params.permit(:title, :image, :description, :notes, :rating)
    end

    private

    def render_not_found_response
        render json: {error: "spice not found"}, status: :not_found
    end

end
