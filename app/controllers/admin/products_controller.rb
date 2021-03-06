class Admin::ProductsController < ApplicationController
  layout "admin"

  before_action :signed_in_admin
  
  def index
    @products=Product.all
  end

  def show
    @product=Product.find(params[:id])
  end

  def new
    @product=Product.new
  end

  def create
    @product=Product.new(product_params)
    if @product.save
      redirect_to admin_products_path
    else
      render 'new'
    end
  end

  def edit
    @product=Product.find(params[:id])
  end

  def update
    @product=Product.find(params[:id])

    if @product.update(product_params)
      redirect_to admin_products_path
    else
      render 'edit'
    end
  end

  def destroy
    Product.find(params[:id]).destroy
    redirect_to admin_products_path
  end

  private

  def product_params
    params.require(:product).permit(:name,:description,:details,:price)
  end
end
