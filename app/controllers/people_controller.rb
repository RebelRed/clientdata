class PeopleController < ApplicationController
    before_filter :authenticate_user!

  before_action :set_person, only: [:show, :edit, :update, :destroy]

  # GET /people
  # GET /people.json
  def index
    
    if params[:search]
      @people = Person.search(params[:search]).order("created_at DESC").paginate(page: params[:page], per_page: 5)
   elsif params[:tag]
     @people = Person.tagged_with(params[:tag]).paginate(page: params[:page])
    else
    @people = Person.all.paginate(page: params[:page])
  end
end
 

  # GET /people/1
  # GET /people/1.json
  def show
  end

  # GET /people/new
  def new
    @person = Person.new

  end

  # GET /people/1/edit
  def edit

  end

  # POST /people
  # POST /people.json
  def create
    @person = Person.new(person_params)

    respond_to do |format|
      if @person.save
        person.tag_list="superhero,supervillian,sidekick"
        person.tag_list
        format.html { redirect_to @person, notice: 'Person was successfully created.' }
        format.json { render :show, status: :created, location: @person }
      else
        format.html { render :new }
        format.json { render json: @person.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /people/1
  # PATCH/PUT /people/1.json
  def update
    respond_to do |format|
      if @person.update(person_params)
        format.html { redirect_to @person, notice: 'Person was successfully updated.' }
        format.json { render :show, status: :ok, location: @person }
      else
        format.html { render :edit }
        format.json { render json: @person.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /people/1
  # DELETE /people/1.json
  def destroy
    @person.destroy
    respond_to do |format|
      format.html { redirect_to people_url, notice: 'Person was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  # def disable
  #   @person = Person.find(params[:id])
  #   @person.update_attribute :disable_person
  #   flash[:notice] = "marked as Disabled"
  #   redirect_to disable_person_path
  # end
  


   def disabled 
    @people = Person.where(disable_person: true).paginate(page: params[:page])
    #@person = Person.where(disable_person: true)
    # respond_to do |format|
    #   format.html { render :index}
    #   format.json { head :no_content} 
    # end

     render 'index'
    end
    
    def tagged
    if params[:tag].present? 
      @people = Person.tagged_with(params[:tag])
    else 
      @people = Person.all
    end  
  end
#   private
#     # Use callbacks to share common setup or constraints between actions.
#     def set_person
#       @person = Person.find(params[:id])
#     end

#     # Never trust parameters from the scary internet, only allow the white list through.
#     def person_params
#       params.require(:person).permit(:first_name, :last_name, :job, :email, :city, :country, :key_contact, :tag_list, :notes, :disable_person)
#     end
# end
