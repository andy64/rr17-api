class SourceParsersController < ApiBaseController
  before_action :set_source_parser, only: [:show, :update, :destroy]

  # GET /source_parsers
  def index
    @source_parsers = SourceParser.all

    render json: @source_parsers
  end

  # GET /source_parsers/1
  def show
    render json: @source_parser
  end

  # POST /source_parsers
  def create
    @source_parser = SourceParser.new(source_parser_params)

    if @source_parser.save
      render json: @source_parser, status: :created, location: @source_parser
    else
      render_error @source_parser
    end
  end

  # PATCH/PUT /source_parsers/1
  def update
    if @source_parser.update(source_parser_params)
      render json: @source_parser
    else
      render_error @source_parser
    end
  end

  # DELETE /source_parsers/1
  def destroy
    @source_parser.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_source_parser
      @source_parser = SourceParser.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def source_parser_params
      params.fetch(:source_parser, {})
    end
end
