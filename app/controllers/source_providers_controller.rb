class SourceProvidersController < ApplicationController
  before_action :set_source_provider, only: [:show, :update, :destroy]

  def noaction
    render json: { provider: 'rr17-api', version: '1' }
  end
  # GET /source_providers
  def index
    @source_providers = SourceProvider.where active: true

    render json: @source_providers
  end

  # GET /source_providers/1
  def show
    render json: @source_provider.active ? @source_provider : 'no results'
  end

  # POST /source_providers
  def create
    @source_provider = SourceProvider.new(source_provider_params)

    if @source_provider.save
      render json: @source_provider, status: :created, location: @source_provider
    else
      render json: @source_provider.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /source_providers/1
  def update
    if @source_provider.update(source_provider_params)
      render json: @source_provider
    else
      render json: @source_provider.errors, status: :unprocessable_entity
    end
  end

  # DELETE /source_providers/1
  def destroy
    @source_provider.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_source_provider
      @source_provider = SourceProvider.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def source_provider_params
      params.require(:source_provider).permit(:name, :url, :address)
    end
end
