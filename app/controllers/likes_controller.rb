class LikesController < ApplicationController

  before_action :authenticate_user!
  def create
    @like = Like.create(user_id: current_user.id, product_id: params[:product_id])
    @product = Product.find(params[:product_id])
    end

  def destroy
    @like = Like.find(params[:id]).destroy
    @product = Product.find(params[:product_id])
  end
end
