class ProductsController < ApplicationController
  def index
    @product_categories = ProductCategory.all
    @q = Product.ransack(params[:q])
    @pagy, @products = pagy @q.result(distinct: true), items: 7

    respond_to do |format|
      format.html
      format.json do
        render json: { entries: render_to_string(partial: 'products', formats: [:html]), pagination: view_context.pagy_nav(@pagy) }
      end
    end
  end

  def show
    @product = Product.find(params[:id])
  end

  private

  def product_params
    params.require(:product).permit(:category)
  end
end
