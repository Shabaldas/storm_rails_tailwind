class Webhooks::LiqpayController < ApplicationController
  def create
    ap params.to_unsafe_h
    
    liqpay = Liqpay.new
    data = params['data']
    signature = params['signature']

    if liqpay.match?(data, signature)
      ap responce_hash = liqpay.decode_data(data)
      # Check responce_hash['status'] and process due to Liqpay API documentation.
    else
      # ap liqpay
    end

  end
end
