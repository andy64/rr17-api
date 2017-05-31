require 'parsers'

class SourceProvidersController < ApiBaseController
  before_action :set_source_provider, only: [:show, :update, :destroy]
  include ParserCurrency

  def noaction
    render json: {provider: 'rr17-api', version: '1'}
  end

  def parse_now
    name = params[:provider_name]
    class_var = name.capitalize+'Parser'
    # class_var.constantize
    parsed_response = nil
    status = 201
    begin
      parsed_response = self.class.const_get(class_var).new.parse
    rescue => e
      status = 400
      parsed_response = "{errors:[{parsed:false, message:#{e.message}}]}"
    ensure
      render json: parsed_response, status: status
    end
  end

  def parse_all
    raise "Not implemented yet!"

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
      render_error @source_provider
    end
  end

  # PATCH/PUT /source_providers/1
  def update
    if @source_provider.update(source_provider_params)
      render json: @source_provider
    else
      render_error @source_provider
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
