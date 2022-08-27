# frozen_string_literal: true

class OrdersController < ApplicationController
  include PriceHelper
  layout 'checkout'

  def checkout
    @order = current_cart.order.presence || create_orders
  end

  def update
    @order = current_cart.order.presence || create_orders
    ap total_price_second(current_cart)
    # ap @order
    ap params[:order][:email].presence || User.first.email
    ap params.to_unsafe_h
    ap llll
    
    # render partial: "test"

    liqpay = Liqpay.new
    test_pay = liqpay.api('request',
      {
        action: 'invoice_send',
        version: '3',
        amount: total_price_second(current_cart).to_s,
        email: params[:order][:email].presence || User.first.email,
        currency: 'UAH',
        order_id: Time.now.to_i,
        result_url: home_url,
        server_url: webhooks_liqpay_callback_url
      })

    redirect_to test_pay['href']
  end

  private

  def create_orders
    order = Order.new
    order.save
    current_cart.update(order_id: order.id)
    order
  end
end
