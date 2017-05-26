class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :destroy, :borrow]
  before_action :set_user, only: [:borrow]
  before_action :check_amout, only: :borrow

  # GET /items
  # GET /items.json
  def index
    @items = Item.all
  end

  # GET /items/1
  # GET /items/1.json
  def show
  end

  # GET /items/new
  def new
    @item = Item.new
  end

  # GET /items/1/edit
  def edit
  end

  # POST /items
  # POST /items.json
  def create
    @item = Item.new(item_params)

    respond_to do |format|
      if @item.save
        format.html { redirect_to @item, notice: 'Item was successfully created.' }
        format.json { render :show, status: :created, location: @item }
      else
        format.html { render :new }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /items/1
  # PATCH/PUT /items/1.json
  def update
    respond_to do |format|
      if @item.update(item_params)
        format.html { redirect_to @item, notice: 'Item was successfully updated.' }
        format.json { render :show, status: :ok, location: @item }
      else
        format.html { render :edit }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /items/1
  # DELETE /items/1.json
  def destroy
    @item.destroy
    respond_to do |format|
      format.html { redirect_to items_url, notice: 'Item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def borrow
    @user.borrow(@item, params[:amount])
    render json: {message: "Item successfully borrowed"}, status: :ok
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_item
    @item = Item.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def item_params
    params.require(:item).permit(:title, :length, :copies, :item_type)
  end

  def set_user
    @user = User.find_by(username: params[:username])
    render json: {error: "Invalid User"}, status: :unprocessable_entity if @user.nil?
  end

  def check_amout
    return true if @item.available_copies.count > params[:amount].to_i
    render json: {error: "Not enough copies available"}, status: :unprocessable_entity
  end
end
