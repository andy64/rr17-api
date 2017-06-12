
# class V1::SourceProvidersController < V1::ApiBaseController
class SourceProvidersController < ApplicationController
  before_action :set_source_provider, only: [:show, :update, :destroy]

  def noaction
    redirect_to 'http://localhost:4567/'

  end

  def parse_now
    sp = SourceProvider.find_by(name: params[:provider_name][0..20])
    raise 'Sourse parser not found' unless sp
    status = 200
    parsed_response = sp.do_parse
  rescue => e
    status = 400
    parsed_response = "{errors:[{parsed:false, message:#{e.message}}], status: 400}"
  ensure
    render json: parsed_response, status: status
  end

  def parse_all
    parsed_response, status = "{scheduled:#{Time.now}, status: 203}", 203
    SourceProvider.all.each do |sp|
      sp.do_parse
    end
  rescue => e
    status = 400
    parsed_response = "{errors:[{parsed:false, message:#{e.message}}], status: 400}"
  ensure
    render json: parsed_response, status: status
  end

  # GET /source_providers
  def index
    @source_providers = SourceProvider.all

    render json: @source_providers
  end

  # GET /source_providers/1
  def show
    render json: @source_provider.active ? @source_provider : 'no results'
  end

  # POST /source_providers
  def create
    params[:user_id] = current_user[:id]
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
    if @source_provider.destroyable_by?(current_user)
      @source_provider.destroy
    else
      @source_provider.errors.add(:base, :not_destroyed, message: "Only author can delete sp")
      render_error @source_provider
    end
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
