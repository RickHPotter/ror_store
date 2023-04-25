# frozen_string_literal: true

# Products Controller
class ProductsController < ApplicationController
  before_action :set_product, only: %i[edit update destroy]

  private

  def product_params
    params.require(:product).permit(
      :name,
      :description,
      :department_id,
      :price,
      :stock
    )
  end

  def set_product
    @product = Product.find(params[:id])
  end

  def _render(view)
    @department = Department.all
    render view
  end

  public

  def index
    @products = Product.order(name: :asc)
    @on_sale = Product.order(:price).limit(1)
    @products_not_on_sale = @products.select { |prod| @on_sale.exclude? prod }
  end

  def new
    @department = Department.all
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      flash[:notice] = 'Poduct saved successfully.'
      redirect_to root_path
    else
      _render :new
    end
  end

  def edit
    _render :edit
  end

  def update
    if @product.update(product_params)
      flash[:notice] = 'Product updated successfully.'
      redirect_to root_path
    else
      _render :edit
    end
  end

  def destroy
    Product.destroy(params[:id])
    redirect_to root_path
  end

  def search
    @name = params[:name]
    @search = Product.where 'name like ?', "%#{@name}%"
  end
end
