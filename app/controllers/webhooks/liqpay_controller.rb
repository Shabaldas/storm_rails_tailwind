class Webhooks::LiqpayController < ApplicationController
  def create
    # ap params.to_unsafe_h
    liqpay = Liqpay.new
    data = params['data']
    signature = params['signature']

    return unless liqpay.match?(data, signature)

    responce_hash = liqpay.decode_data(data)
    return unless responce_hash['status'] == 'success'

    order = Order.find(responce_hash['order_id'])
    order.paid!
    order.cart.cart_items.destroy_all
  end
end
