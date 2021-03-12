class BuyersController < ApplicationController
  def index
    @buyer_residence = BuyerResidence.new
    @item = Item.find(params[:item_id])
  end

  def create
    @item = Item.find(params[:item_id])
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
    params.require(:buyer_residence).permit(:postal_code, :prefecture_id, :city, :house_number, :building_name, :phone_number).merge(user_id: current_user.id, item_id: @item.id, token: params[:token], price: @item.price )
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: buyer_params[:price],  
      card: buyer_params[:token],    
      currency: 'jpy'                 
    )
  end
end
