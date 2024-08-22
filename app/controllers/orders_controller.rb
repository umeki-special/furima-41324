class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item, only: [:show, :edit, :index, :create] # indexアクションにも適用
  before_action :login_user, only: :index

  def index
    gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
    @order_form = OrderForm.new
  end

  def new
    @order_form = OrderForm.new
  end


  def create
    @order_form = OrderForm.new(order_form_params)
    if @order_form.valid?
      pay_item
      @order_form.save
      return redirect_to root_path
    else
      gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
      render 'index', status: :unprocessable_entity
    end
  end

  def edit
  end

  def show
  end

  private

  def set_item
    @item = Item.find(params[:item_id])
  end

  def login_user
    if @item.history.present? && current_user.id != @item.user_id
      redirect_to root_path
    elsif current_user.id == @item.user_id
      redirect_to root_path
    end
  end

  def order_form_params
    params.require(:order_form).permit(
      :post_code, :prefecture_id, :city, :address, :phone_number, :price
    ).merge(token: params[:token], user_id: current_user.id, item_id: @item.id)
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,   # 商品の値段
      card: order_form_params[:token],    # カードトークン
      currency: 'jpy'                 # 通貨の種類（日本円）
    )
  end

end
