class TenantsController < ApplicationController

    def index
        tenant = Tenant.all
        render json: tenant, status: :ok
    end

    def create
        tenant = Tenant.create(tenant_params)
        if tenant.valid?
            render json: tenant, status: :created
        else
            rend json: { errors: tenant.errors.full_messages }, status: :unprocessable_entity
        end

    def destroy
        tenant = Tenant.find_by(id: params[:id])
        tenant.destroy
        head :no_content
    end

    private

    def tenant_params
        params.permit(:name, :age)
    end

end
