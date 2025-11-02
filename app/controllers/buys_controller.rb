class BuysController < ApplicationController
  before_action :authenticate_user!, only: [:index]
  before_action :move_to_index, only: [:index, :create]
  def index
    gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
    @item = Item.find(params[:item_id])
    @buy = FormObject.new
  end

  def create
    @item = Item.find(params[:item_id])
    @buy = FormObject.new(buy_params)

    if @buy.valid?
      pay_item

      @buy.save
      redirect_to root_path
    else
      gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
      render :index, status: :unprocessable_entity
    end
  end

  private

  def buy_params
    params.require(:form_object).permit(:postnumber, :prefecture_id, :municipality, :street_address, :building, :tel).merge(user_id: current_user.id, item_id: params[:item_id],token: params[:token], price: @item.price)
  end

  def move_to_index
    item = Item.find(params[:item_id])
    if current_user.id == item.user_id
      redirect_to root_path
    end
  end

  def pay_item
      Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount: buy_params[:price],  # 商品の値段
        card: buy_params[:token],    # カードトークン
        currency: 'jpy'                 # 通貨の種類（日本円）
      )
  end
end
