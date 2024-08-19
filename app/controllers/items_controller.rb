class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :check_item_owner, only: [:edit, :update]
  before_action :find_item, only: :order  # 「find_item」を動かすアクションを限定

  def new
    @item = Item.new
  end

  def show
    # @itemはbefore_actionでセットされます
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

  def edit
    # @itemはbefore_actionでセットされます
  end

  def update
    if @item.update(item_params)
      redirect_to @item, notice: '商品が更新されました。'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @item.destroy
    redirect_to root_path, notice: '商品が削除されました。'
  end

  def order
    redirect_to new_card_path and return unless current_user.card.present?

    Payjp.api_key = ENV["PAYJP_SECRET_KEY"] # 環境変数を読み込む
    customer_token = current_user.card.customer_token # ログインしているユーザーの顧客トークンを定義
    Payjp::Charge.create(
      amount: @item.price, # 商品の値段
      customer: customer_token, # 顧客のトークン
      currency: 'jpy' # 通貨の種類（日本円）
    )

    ItemOrder.create(item_id: params[:id]) # 商品のid情報を「item_id」として保存する
    
    redirect_to root_path

  end

  private

  def find_item
    @item = Item.find(params[:id]) # 購入する商品を特定
  end

  private

  def set_item
    @item = Item.find_by(id: params[:id])
    redirect_to root_path, alert: 'アイテムが見つかりません。' unless @item
  end

  def check_item_owner
    if @item.user != current_user
      redirect_to root_path, alert: 'この商品を編集する権限がありません。'
    end
  end

  def item_params
    params.require(:item).permit(:name, :description_of_item, :price, :content, :image, :category_id, :status_id, :shipping_method_id, :region_of_origin_id, :estimated_shipping_date_id).merge(user_id: current_user.id)
  end
end
