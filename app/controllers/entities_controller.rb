class EntitiesController < ApplicationController
  before_filter :authenticate_user!
  before_action :set_entity, only: [:show, :edit, :update, :destroy]

  # GET /entities
  # GET /entities.json
  def index
    
     if params[:search]
      @entities = Entity.search(params[:search]).order("created_at DESC").paginate(page: params[:page])
    else
    @entities = Entity.all.paginate(page: params[:page])
  end
end
  # GET /entities/1
  # GET /entities/1.json
  def show
  end

  # GET /entities/new
  def new
    @entity = Entity.new
    1.times do
     @entity.addresses.build
     end
  end

  # GET /entities/1/edit
  def edit
    #@entity.create_activity key: 'entity.existing_type', owner: current_user
  end

  # POST /entities
  # POST /entities.json
  def create
    @entity = Entity.new(entity_params)


    respond_to do |format|
      if @entity.save
        @entity.create_activity :create, owner: current_user
        format.html { redirect_to @entity, notice: 'Entity was successfully created.' }
        format.json { render :show, status: :created, location: @entity }
      else
        format.html { render :new }
        format.json { render json: @entity.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /entities/1
  # PATCH/PUT /entities/1.json
  def update
 #@entity.create_activity key: 'entity.existing_type', owner: current_user
    @entity.create_activity :update, owner: current_user
    respond_to do |format|
      if @entity.update(entity_params)
        format.html { redirect_to @entity, notice: 'Entity was successfully updated.' }
        format.json { render :show, status: :ok, location: @entity }
      else
        format.html { render :edit }
        format.json { render json: @entity.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /entities/1
  # DELETE /entities/1.json
  def destroy
      @entity = Entity.find(params[:id])
       @entity.create_activity :destroy, owner: current_user
        @entity.destroy
    
    respond_to do |format|
    
      format.html { redirect_to entities_url, notice: 'Entity was successfully destroyed.' }
      format.json { head :no_content }
      
    end
  end

  def disabled 
    
    @entities = Entity.where(disable_person: true).paginate(page: params[:page])

    render 'index'
      
    end

  #   def  addresses

       
     
  #      render :partial => 'entities/address_fields'

    
  # end
  def entity_name
      @entity.create_activity key: 'entity.entity_name', owner: current_user
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    
  

    def set_entity
      @entity = Entity.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def entity_params
      #params[:entity][:selector] ||= ['Applicant']

      params.require(:entity).permit(:entity_name,:existing_type,:billing,:credit,:notes,:disable_person, addresses_attributes: [ :id, :entity_id,:street,:city,:country,:zip,:tmo,:state,:_destroy] , :selector => [])
    end
end
