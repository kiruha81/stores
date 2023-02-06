class GoodsController < ApplicationController
  def create
    @shop = Shop.find(params[:shop_id])
    @good = current_user.goods.new(shop_id: @shop.id)
    if @bad = Bad.find_by(user_id: current_user.id, shop_id: params[:shop_id])
      @bad.destroy
    end
    @good.save
    
  end

  def destroy
    @shop = Shop.find(params[:shop_id])
    @good = current_user.goods.find_by(shop_id: @shop.id)
    @good.destroy
  end
end
