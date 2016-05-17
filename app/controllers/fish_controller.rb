class FishController < ApplicationController
  before_action :authenticate_member!
  before_action :set_fish, only: [:show, :edit, :update, :destroy, :throw_back]

  # GET /fish
  # GET /fish.json
  def index
    @fish = Fish.all
  end
  
  def returned
    @fish = Fish.returned
    render action: :index
  end
  
  def stringer
    @fish = Fish.on_stringer
    render action: :index
  end
  

  # GET /fish/1
  # GET /fish/1.json
  def show
    @tournament = @fish.tournament
  end
  
  def throw_back
    if @fish.on_stringer?
      @fish.update(returned: true)
    else
      @fish.update(returned: false)
    end
    @tournament = @fish.tournament
    # @fish.update(returned: true)
  end
  # GET /fish/new
  def new
    if params[:tournament_id].present?
      @tournament = Tournament.find(params[:tournament_id])
      if @tournament.available_colors.none?
        redirect_to @tournament, notice: "All of the colors are in use. Please throw a fish back before continuing."
      end
      @fish = @tournament.fish.new
    else
      @fish = Fish.new
    end
    @fish.member = current_member
  end

  # GET /fish/1/edit
  def edit
  end

  # POST /fish
  # POST /fish.json
  def create
    if params[:tournament_id].present?
      @tournament = Tournament.find(params[:tournament_id])
      @fish = @tournament.fish.new(fish_params)
    else
      @fish = Fish.new(fish_params)
    end
    @fish.member = current_member
    respond_to do |format|
      if @fish.save
        format.html { redirect_to @fish.tournament, notice: 'Fish was successfully created.' }
        format.json { render :show, status: :created, location: @fish }
      else
        format.html { render :new }
        format.json { render json: @fish.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /fish/1
  # PATCH/PUT /fish/1.json
  def update
    respond_to do |format|
      if @fish.update(fish_params)
        format.html { redirect_to @fish, notice: 'Fish was successfully updated.' }
        format.json { render :show, status: :ok, location: @fish }
      else
        format.html { render :edit }
        format.json { render json: @fish.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /fish/1
  # DELETE /fish/1.json
  def destroy
    @fish.destroy
    respond_to do |format|
      format.html { redirect_to fish_index_url, notice: 'Fish was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_fish
      @fish = Fish.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def fish_params
      params.require(:fish).permit(:color_id, :weight, :over_28, :tournament_id, :member_id, :returned, :image, :remove_image)
    end
end
