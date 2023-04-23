class ProductsController < ApplicationController
  def index
    @products = Product.order(name: :desc)
    @on_sale = Product.order(:price).limit(1)
    @products_not_on_sale = @products.select { |prod| @on_sale.exclude? prod }
  end

  def create
    product =
      params.require(:product).permit(:name, :description, :price, :stock)
    Product.create(product)
    redirect_to root_path
  end

  def edit
    id = params[:id]
    product = Product.find_by(id: id)
    product.update(
      name: product.name,
      description: product.description,
      price: product.price,
      stock: product.stock
    )
    redirect_to root_path
  end

  def destroy
    id = params[:id]
    Product.destroy(id)
    redirect_to root_path
  end
end
