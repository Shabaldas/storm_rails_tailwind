# frozen_string_literal: true

class OrdersController < ApplicationController
  include PriceHelper
  layout 'checkout'
  # before_action :
  def checkout
    @order = current_cart.order.presence || create_orders
  end

  def update
    ap 'YYYYYYYY'
    @order = current_cart.order.presence || create_orders
    ap total_price_second(current_cart)
    ap @order
    
    render partial: "test"

    liqpay = Liqpay.new
  #  ap liqpay.api('request', {
  #     action:   'invoice_send',
  #     version:  '3',
  #     amount:   total_price_second(current_cart).to_s,
  #     email: User.first.email,
  #     currency: 'UAH',
  #     order_id: @order.id,
  #     goods:    [{
  #       amount: 100,
  #       count:  2,
  #       unit:   'шт.',
  #       name:   'телефон'
  #     }]
  #   })

    data      = request.parameters['data']
    signature = request.parameters['signature']

    ap data
    ap signature
    ap liqpay.match?(data, signature)

  #   ap liqpay.cnb_form({
  #     :action         => "pay",
  #     :amount         => total_price_second(current_cart).to_s,
  #     :currency       => "UAH",
  #     :description    => "description text",
  #     :order_id       => @order.id,
  #     :version        => "3"
  #     })

    # ap liqpay
  end

  private

  def create_orders
    order = Order.new
    order.save
    current_cart.update(order_id: order.id)
    order
  end
end
