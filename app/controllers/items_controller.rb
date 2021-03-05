class ItemsController < ApplicationController

  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

    def create
      @item = Prototype.new(item_params)
      if @item.save
        redirect_to root_path
      else
        render :new
      end
    end

  private

  def item_params
    params.require(:item).permit(:image, :name, :text, :category_id, :states_id, :delivery_fee_id, :prefecture_id, :shipping_day_id, :price).merge(user_id: current_user.id)
  end
end
