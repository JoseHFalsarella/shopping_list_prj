class ItemsController < ApplicationController
  before_action :set_item, only: %i[ show edit update destroy ]

  # GET /items or /items.json
  def index
    @items = Item.all
  end

  # GET /items/1 or /items/1.json
  def show
  end

  # GET /items/new
  def new
    @item = Item.new
  end

  # GET /items/1/edit
  def edit
  end

  # POST /items or /items.json
  def create
    @list = List.find(params[:list_id])
    @item = @list.items.build(item_params)

    respond_to do |format|
      if @item.save
        format.html { redirect_to @list, notice: "Item was successfully added to the list." }
        format.json { render :show, status: :created, location: @item }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /items/1 or /items/1.json
  def update
    @list = List.find(params[:list_id])
    @item = @list.items.find(params[:id])

    respond_to do |format|
      if @item.update(item_params)
        format.html { redirect_to @list, notice: "Item was successfully updated." }
        format.js  
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.js   
      end
    end
  end
  

  # DELETE /items/1 or /items/1.json
  def destroy
    @list = List.find(params[:list_id])
    @item = @list.items.find(params[:id])
    @item.destroy

    respond_to do |format|
      format.html { redirect_to @list, status: :see_other, notice: "Item was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_item
      @item = Item.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def item_params
      params.require(:item).permit(:name, :quantity, :status, :list_id)
    end
end
