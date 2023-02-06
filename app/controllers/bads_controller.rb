class BadsController < ApplicationController
  def create
    @shop = Shop.find(params[:shop_id])
    @bad = current_user.bads.new(shop_id: @shop.id)
    if @good = Good.find_by(user_id: current_user.id, shop_id: params[:shop_id])
      @good.destroy
    end
    @bad.save
  end

  def destroy
    @shop = Shop.find(params[:shop_id])
    @bad = current_user.bads.find_by(shop_id: @shop.id)
    @bad.destroy
  end
end
