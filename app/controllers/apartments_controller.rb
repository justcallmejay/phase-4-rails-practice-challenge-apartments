class ApartmentsController < ApplicationController

    def index
        apartment = Apartment.all
        render json: apartment, status: :ok
    end

    def create
        apartment = Apartment.create(apartment_params)
        if apartment.valid?
            render json: apartment, status: :created
        else
            render json: { errors: apartment.errors.full_messages }, status: :unprocessable_entity
        end
    end

    def destroy
        apartment = Apartment.find_by(id: params[:id])
        apartment.destroy
        head :no_content   
    end

    private

    def apartment_params
        params.permit(:number)
    end
end
