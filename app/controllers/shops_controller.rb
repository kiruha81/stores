class ShopsController < ApplicationController
  def new
    @shop = Shop.new
  end

  def create
    @shop = Shop.new(shop_params)
    @shop.user_id = current_user.id
    @shop.save
    redirect_to shop_path(@shop.id)
  end

  def show
    @shop = Shop.find(params[:id])
    @user = @shop.user
  end

  def index
    @shops = Shop.all
  end

  def edit
    @shop = Shop.new
    @shop = Shop.find(params[:id])
  end

  def update
    @shop = Shop.find(params[:id])
    @shop.user_id = current_user.id
    @shop.update(shop_params)
    redirect_to shop_path(@shop)
  end

  def destroy
    @shop = Shop.find(params[:id])
    @shop.user_id = current_user.id
    @shop.destroy
    redirect_to shops_path
  end

  def shop_params
    params.require(:shop).permit(:title, :shop_name, :shop_image, :body)
  end
end