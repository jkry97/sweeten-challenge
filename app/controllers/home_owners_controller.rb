class HomeOwnersController < ApplicationController
  before_action :set_home_owner, only: [:show, :edit, :update, :destroy]

  # GET /home_owners
  # GET /home_owners.json
  def index
    @home_owners = HomeOwner.all
  end

  # GET /home_owners/1
  # GET /home_owners/1.json
  def show
    @contractors = Contractor.where('min_budget >= ?', @home_owner.min_budget)
                             .where('max_budget <= ?', @home_owner.max_budget)
                             .where(build_services: @home_owner.build_services)
                             .where(design_services: @home_owner.design_services)
                             .sort_by{ | contractor | @home_owner.coordinateToDistance({
                               latitude: contractor.latitude,
                               longitude: contractor.longitude
                               }) }

  @contractors = @contractors[0..2]   
  puts "===========> contractor count: "+ @contractors.count.inspect                          
  end

  # GET /home_owners/new
  def new
    @home_owner = HomeOwner.new
  end

  # GET /home_owners/1/edit
  def edit
  end

  # POST /home_owners
  # POST /home_owners.json
  def create
    @home_owner = HomeOwner.new(home_owner_params)

    respond_to do |format|
      if @home_owner.save
        format.html { redirect_to @home_owner, notice: 'Home owner was successfully created.' }
        format.json { render :show, status: :created, location: @home_owner }
      else
        format.html { render :new }
        format.json { render json: @home_owner.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /home_owners/1
  # PATCH/PUT /home_owners/1.json
  def update
    respond_to do |format|
      if @home_owner.update(home_owner_params)
        format.html { redirect_to @home_owner, notice: 'Home owner was successfully updated.' }
        format.json { render :show, status: :ok, location: @home_owner }
      else
        format.html { render :edit }
        format.json { render json: @home_owner.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /home_owners/1
  # DELETE /home_owners/1.json
  def destroy
    @home_owner.destroy
    respond_to do |format|
      format.html { redirect_to home_owners_url, notice: 'Home owner was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_home_owner
      @home_owner = HomeOwner.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def home_owner_params
      params.require(:home_owner).permit(:latitude, :longitude, :min_budget, :max_budget, :build_services, :design_services)
    end
end
