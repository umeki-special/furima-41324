class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

  def new
    @item = Item.new
  end

  def show
    @item = Item.find_by(id: params[:id])
    unless @item
      redirect_to items_path, alert: "Item not found"
    end
  end

  def create
    @item = current_user.items.build(item_params)
    if @item.save
      redirect_to root_path, notice: '商品が作成されました。'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def index
    @items = Item.order(created_at: :desc)  # 新しい順にソート
  end

  private

  def item_params
    params.require(:item).permit(:name, :description_of_item, :price, :content, :image, :category_id, :status_id, :shipping_method_id, :region_of_origin_id, :estimated_shipping_date_id).merge(user_id: current_user.id)
  end
end
