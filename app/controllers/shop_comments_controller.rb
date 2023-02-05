class ShopCommentsController < ApplicationController
  def create
    @shop = Shop.find(params[:shop_id])
    comment = current_user.shop_comments.new(shop_comment_params)
    comment.shop_id = @shop.id
    comment.save
    @shop_comment = ShopComment.new
  end

  def destroy
    @shop = Shop.find(params[:shop_id])
    ShopComment.find_by(params[:id], shop_id: params[:shop_id]).destroy
    @shop_comment = ShopComment.new
  end

  private

  def shop_comment_params
    params.require(:shop_comment).permit(:comment)
  end

end
