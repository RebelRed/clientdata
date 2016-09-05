class UsersController < ApplicationController
 before_filter :authenticate_user!

  before_action :set_user, only: [:show, :edit, :update, :destroy]

  # GET /users
  # GET /users.json
  def index
    
    if params[:search]
      @users = User.search(params[:search]).order("created_at DESC").paginate(page: params[:page], per_page: 5)
   elsif params[:tag]
     @users = User.tagged_with(params[:tag]).paginate(page: params[:page])
    else
    @users = User.all.paginate(page: params[:page])
  end
end
 

  # GET /users/1
  # GET /users/1.json
  def show
  end

  # GET /users/new
  def new
    @user = User.new

  end

  # GET /users/1/edit
  def edit

  end

  # POST /users
  # POST /users.json
  def create
    @users = User.new(user_params)

    respond_to do |format|
      if @user.save
        user.tag_list="superhero,supervillian,sidekick"
        user.tag_list
        format.html { redirect_to @user, notice: 'user was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'user was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'user was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  # def disable
  #   @user = user.find(params[:id])
  #   @user.update_attribute :disable_user
  #   flash[:notice] = "marked as Disabled"
  #   redirect_to disable_user_path
  # end
  


   def disabled 
    @users = User.where(disable_user: true).paginate(page: params[:page])
    #@user = user.where(disable_user: true)
    # respond_to do |format|
    #   format.html { render :index}
    #   format.json { head :no_content} 
    # end

     render 'index'
    end
    
    def tagged
    if params[:tag].present? 
      @users = User.tagged_with(params[:tag])
    else 
      @users = User.all
    end  
  end
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:first_name, :last_name, :job, :email, :city, :country, :key_contact, :tag_list, :notes, :disable_person)
    end
end
