class BuyersController < ApplicationController
  def index
    @buyer_residence = BuyerResidence.new
  end
end
