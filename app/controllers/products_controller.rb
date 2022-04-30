class ProductsController < ApplicationController
  def index
    @product_categories = ProductCategory.all
    @pagy, @products = pagy Product.all, items: 7

    respond_to do |format|
      format.html
      format.json do
        render json: { entries: render_to_string(partial: 'products', formats: [:html]), pagination: view_context.pagy_nav(@pagy) }
      end
    end
  end

  def show
    @product = Product.find(params[:id])
    # ap  @product.files.first.download
  end

  private

  def product_params
    params.require(:product).permit(:category)
  end
end
