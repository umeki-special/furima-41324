class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :check_item_owner, only: [:edit, :update]
  before_action :find_item, only: :order  

  def new
    @item = Item.new
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


  def update
    if @item.update(item_params)
      redirect_to @item, notice: '商品が更新されました。'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if current_user.id == @item.user_id
      @item.destroy
    end
      redirect_to root_path
  end

  private

  def set_item
    @item = Item.find_by(id: params[:id])
    redirect_to root_path, alert: 'アイテムが見つかりません。' unless @item
  end

  def check_item_owner
    if @item.user_id != current_user.id || @item.sold?
      redirect_to root_path
    end
  end

  def item_params
    params.require(:item).permit(:name, :description_of_item, :price, :content, :image, :category_id, :status_id, :shipping_method_id, :region_of_origin_id, :estimated_shipping_date_id).merge(user_id: current_user.id)
  end
end
