class UsersController < ApiBaseController
  before_action :set_user, only: [:show, :update, :destroy]
  #before_action :auth_user!, only: :create
  #http_basic_authenticate_with :admin, password: '123456'


  # GET /users
  def index
    @users = User.all

    render json: @users
  end

  # GET /users/1
  def show
    render json: @user
  end

  # POST /users
  def create
    @user = User.new(user_params)
    if @user.save
      render json: @user, status: :created, location: @user
    else
      render_error @user
    end
  end

  # PATCH/PUT /users/1
  def update
    if @user.update(user_params)
      render json: @user
    else
      render_error @user
    end
  end

  # DELETE /users/1
  def destroy
    parsed_response = nil
    status = 203
    raise "cannot remove the last user" if User.all.size<2
    raise "not destroyed" unless @user.destroy
  rescue => e
    status = 400
    parsed_response = "{errors:[{destroyed:false, message:#{e.message}}], status: 400}"
    logger.error e.message
  ensure
    render json: parsed_response, status: status
  end

  def set_user
    @user = User.find(params[:id])
  rescue => e
    status = 404
    parsed_response = "{errors:[{message:#{e.message}}], status: 400}"
    logger.error e.message
    render json: parsed_response, status: status
  end

  # Only allow a trusted parameter "white list" through.
  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password)
  end

  def auth_user
    user = User.find_by(id: source_provider_params[:user_id])
    render json: "", status: 403 unless user
  end
end
