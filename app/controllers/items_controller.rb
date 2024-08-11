class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to @item, notice: '商品が作成されました。'
    else
      render :new
    end
  end

  def index
    # 必要に応じてインスタンス変数などを定義
  end

  private

  def item_params
    params.require(:item).permit(:name, :description, :price, :image)
  end
end