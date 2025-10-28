class BuysController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
    @buy = FormObject.new
  end

  def create
    binding.pry
  end
end
