class ShipItemsController < ApplicationController
before_action :set_ship_item, only: [:show, :edit, :update, :destroy]

  # GET /ships
  # GET /ships.json
  def index
    @ship_items = ShipItem.all
  end

  # GET /ships/1
  # GET /ships/1.json
  def show
  end

  # GET /ships/new
  def new
    @ship_item = ShipItem.new
  end

  # GET /ships/1/edit
  def edit
  end

  # POST /ships
  # POST /ships.json
  def create
    @ship_item = ShipItem.new(ship_item_params)

    respond_to do |format|
      if @ship_item.save
        format.html { redirect_to ship_item_path, notice: 'Ship item was successfully created.' }
        format.json { render :show, status: :created, location: ship_items_path }
      else
        format.html { render :new }
        format.json { render json: @ship_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /ships/1
  # PATCH/PUT /ships/1.json
  def update
    respond_to do |format|
      if @ship_item.update(ship_item_params)
        format.html { redirect_to player_ships_path, notice: 'Ship item was successfully updated.' }
        format.json { render :show, status: :ok, location: player_ships_path }
      else
        format.html { render :edit }
        format.json { render json: @ship_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ships/1
  # DELETE /ships/1.json
  def destroy
    @ship_item.destroy
    respond_to do |format|
      format.html { redirect_to player_ships_path, notice: 'Ship was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ship_item
      @ship_item = ShipItem.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def ship_item_params
      params.require(:ship_item).permit(:ship_id, :item_id, :quantity)
    end
end
