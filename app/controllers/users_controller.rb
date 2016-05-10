class UsersController < ApplicationController

  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @user = User.find(params[:id])
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
    @user = User.find(params[:id])
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params(params))

    if @user.save
      respond_to do |format|
        # format.html { render layout: 'layouts/application', html: '' }
        # na hora de dar o create ele n funcionava erro de template 'missing template'
        format.html { redirect_to @user }
        format.json { render json: @user }
      end
    else
      render json: { errors: @user.errors }, status: :bad_request
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    @user = User.find(params[:id])
    @user.assign_attributes(user_params(params))
    if @user.save
       render :show
    else
      render json: @user.errors
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user = User.find(params[:id])
    @user.destroy
    render :index
  end

  private
  # Never trust parameters from the scary internet, only allow the white list through.
  def user_params(params)
    params.require(:user).permit(:nome, :idade, :endereco)
  end
end
