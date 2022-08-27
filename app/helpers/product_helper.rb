module ProductHelper
  def stl_or_obj(product_name)
    if product_name.include?('.stl') || product_name.include?('.STL')
      image_tag('shop_img/stl_logo')
    elsif product_name.include?('.obj')
      image_tag('shop_img/obj_logo')
    end
  end
end
