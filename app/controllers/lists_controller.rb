class ListsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_list, only: %i[ show edit update destroy ]
  before_action :correct_user, only: %i[ show edit update destroy ]

  # GET /lists or /lists.json
  def index
    @lists = current_user.lists
  end

  # GET /lists/1 or /lists/1.json
  def show
  end

  # GET /lists/new
  def new
    @list = current_user.lists.build
  end

  # GET /lists/1/edit
  def edit
  end

  # POST /lists or /lists.json
  def create
    @list = current_user.lists.build(list_params)

    respond_to do |format|
      if @list.save
        format.html { redirect_to @list, notice: "List was successfully created." }
        format.json { render :show, status: :created, location: @list }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @list.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /lists/1 or /lists/1.json
  def update
    respond_to do |format|
      if @list.update(list_params)
        format.html { redirect_to @list, notice: "List was successfully updated." }
        format.json { render :show, status: :ok, location: @list }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @list.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /lists/1 or /lists/1.json
  def destroy
    @list.destroy

    respond_to do |format|
      format.html { redirect_to root_path, status: :see_other, notice: "List was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_list
      @list = List.find(params[:id])
    end

    def correct_user
      @list = current_user.lists.find_by(id: params[:id])
      redirect_to lists_path, notice: "Not authorized to access this list" if @list.nil?
    end

    # Only allow a list of trusted parameters through.
    def list_params
      params.require(:list).permit(:name)
    end
end
