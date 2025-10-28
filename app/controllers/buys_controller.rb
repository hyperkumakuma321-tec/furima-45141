class BuysController < ApplicationController
  def index
    @buys = Buy.all
  end
end
