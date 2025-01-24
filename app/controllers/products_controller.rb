class ProductsController < ApplicationController
  # Before action let you to extract share code
  # and allow_unauthenticated_access
  allow_unauthenticated_access only: %i[index show]
  before_action :set_product, only: %i[show edit update destroy]

  def index
    # at simple means that the instance variable is available in the view
    @products = Product.all
  end

  # Show each product
  def show
    # @product = Product.find(params[:id])
  end

  # Create a new product
  def new
    @product = Product.new
  end

  # DB Create
  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to @product
    else
      render :new, status: :unprocessable_entity
    end
  end

  # Edit a product
  def edit
    # @product = Product.find(params[:id])
    # if @product.update(product_params)
    # redirect_to @product
    # else
    # render :edit, status: :unprocessable_entity
    # end
  end

  # Update a product
  def update
    if @product.update(product_params)
      redirect_to @product
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # Destroy a product
  def destroy
    @product.destroy
    redirect_to products_path
  end

    private
      def set_product
        @product = Product.find(params[:id])
      end

      def product_params
        params.expect(product: [ :name, :description, :featured_image, :inventory_count ])
      end
end
