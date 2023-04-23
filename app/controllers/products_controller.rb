# Products Controller
class ProductsController < ApplicationController
  def index
    @products = Product.order(name: :asc)
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
    product_id = params[:id]
    product = Product.find_by(id: product_id)
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

  def search
    @name = params[:name]
    @search = Product.where "name like ?", "%#{@name}%"
  end
end
