class BuysController < ApplicationController
  def index
    @buys = FormObject.all
  end
end
