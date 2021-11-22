class ProductsController < ApplicationController
  def index
    @products = store.products
  end

  # def products
  #   @products = Product.includes(:store, :categories).available
  # end

  def new
    @store = Store.find(params[:store_id])
    @user = current_user  
    @product = @store.products.build
  end

  def show
    id = params[:id]
    @product = Product.find(id)
  end

  def create
    @product = store.products.build(product_params)
    if @product.save
      redirect_to user_store_products_path(@product), notice: 'Product was successfully created'
    else
      flash[:error] = "Product could not be created"
      render 'new'
    end
  end

  def edit
    @store = Store.find(params[:store_id])
    @user = current_user  
    @product = store.products.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    if @product.update(product_params)
      redirect_to user_stores_path(), notice: 'Product updated successfully'
    else
      flash[:error] = 'Cannot update Product'
      render 'edit'
    end
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    redirect_to user_stores_path(), notice: 'Product deleted successfully'
  end


  private 

  def store
    @store ||= Store.find(params[:store_id])
  end
  
  def product_params
    params.require(:product).permit(
      :name,
      :description,
      :price,
      :weight,
      :all_categories,
      :store_id,
      :product_background
    )
  end
end
