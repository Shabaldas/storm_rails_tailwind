# frozen_string_literal: true

class OrdersController < ApplicationController
  include PriceHelper
  layout 'checkout'

  def checkout
    @order = current_cart.order.presence || create_orders
  end

  def update
    @order = current_cart.order.presence || create_orders
    goods = []
    @order.cart.cart_items.each do |cart_item|
      goods <<
        {
          name: cart_item.cartable.name,
          amount: cart_item.cartable.is_a?(PrintModelAttribute) ? cart_item.cartable.subtotal_price : cart_item.cart_item_option_values.sum(&:price),
          count: cart_item.quantity,
          unit: unit_options(cart_item)
        }
    end

    liqpay = Liqpay.new
    liqpay_request = liqpay.api(
      'request',
      {
        action: 'invoice_send',
        version: '3',
        amount: total_price_second(current_cart).to_s,
        email: params[:order][:email].presence || User.first.email,
        currency: 'UAH',
        order_id: @order.id,
        goods: goods,
        result_url: home_url,
        server_url: webhooks_liqpay_callback_url
      }
    )
    ap '<<<<<<<<<<<<'
    ap liqpay_request
    ap '<<<<<<<<<<<<'

    @order.update(order_params)
    redirect_to liqpay_request['href']

    # if liqpay_request['status'] == 'error'
    #   @order.destroy
    #   set_result_url
    # else
    #   @order.update(order_params)
    #   redirect_to liqpay_request['href']
    # end
  end

  private

  def set_result_url
    if current_user.nil?
      redirect_to home_url
    else
      redirect_to edit_user_registration_path
    end
  end

  def order_params
    params.require(:order).permit(:id, :first_name, :last_name, :phone, :email, :subtotal, :total, :comment)
  end

  def create_orders
    order = Order.new
    order.save
    current_cart.update(order_id: order.id)
    order
  end

  def unit_options(item)
    if item.cartable.is_a?(PrintModelAttribute)
      "; Material: #{item.cartable.material};
      Color: #{item.cartable.color};
      Quality: #{item.cartable.quality}"
    else
      "; Color: #{item.cart_item_option_values
                    .first.product_option_value
                    .option_value.value};
      Size: #{item.cart_item_option_values
                  .last.product_option_value
                  .option_value.value}."
    end
  end
end
