class BuyersController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]
  before_action :set_item, only: [:index, :create]
  before_action :root_path_move, only: [:index, :create]

  def index
    @buyer_residence = BuyerResidence.new
  end

  def create
    @buyer_residence = BuyerResidence.new(buyer_params)
    if @buyer_residence.valid?
      pay_item
      @buyer_residence.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def buyer_params
    params.require(:buyer_residence).permit(:postal_code, :prefecture_id, :city, :house_number, :building_name, :phone_number).merge(
      user_id: current_user.id, item_id: @item.id, token: params[:token]
    )
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: buyer_params[:token],
      currency: 'jpy'
    )
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def root_path_move
    redirect_to root_path if (current_user.id == @item.user_id) || @item.buyer
  end
end
