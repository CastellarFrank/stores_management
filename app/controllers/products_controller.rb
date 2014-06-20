class ProductsController < ApplicationController
  before_action :set_product, only: [:edit, :update, :destroy]
  helper_method :group_name_by_id

  def index
    @products = Product.all
  end

  def new
    @exist_group = Group.all.any?
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    @group = Group.find @product.group_id

    if @product.save
      flash[:notice] = "A new product with name:[#{@product.name}] for the group: [#{@group.name}] has been created."
      redirect_to products_path
    else
      @exist_group = true
      render :new
    end
  end

  def edit
  end

  def update
    @group = Group.find @product.group_id

    if @product.update(product_params)
      flash[:notice] = "Product with name: [#{@product.name}] for the group: [#{@group.name}] has been updated."
      redirect_to products_path
    else
      render :edit
    end
  end

  def destroy
    @group = Group.find @product.group_id
    @product.destroy
    redirect_to products_path, notice: "Product with name:[#{@product.name}] for the group [#{@group.name}] has been deleted."
  end

  private
  def set_product
    @product = Product.find params[:id]
  end

  def product_params
    params.require(:product).permit!
  end

  def group_name_by_id (id)
    g = Group.find id
    s = Store.find g.store_id
    "#{s.name} - #{g.name}"
  end
end
