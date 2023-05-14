class LeasesController < ApplicationController

    def create
        lease = Lease.create(lease_params)
        if lease.save
            render json: lease, status: :created
        else
            render json: { errors: lease.errors.full_messages }, status: :unprocessable_entity
        end
    end

    def destroy
        lease = Lease.find_by(id: params[:id])
        lease.destroy
        head :no_content
    end

    private

    def lease_params
        params.permit(:rent)
    end

end
