class BuysController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
    @buy = FormObject.new
  end

  def create
    @item = Item.find(params[:item_id])
    @buy = FormObject.new(buy_params)

    if @buy.valid?
      @buy.save
      redirect_to root_path
    else
      render :index, status: :unprocessable_entity
    end
  end

  private

  def buy_params
    params.require(:form_object).permit(:postnumber, :prefecture_id, :municipality, :street_address, :building, :tel).merge(user_id: current_user.id, item_id: params[:item_id])
  end

end
