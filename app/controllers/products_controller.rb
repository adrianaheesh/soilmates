class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy, :buy, :favorite]
  before_action :authenticate_user!, except: [:index, :show, :buy, :success, :cancel]

  def index
    pp current_user
    @products = Product.all
  end

  def show
    @favorite_exists = Favorite.where(product: @product, user: current_user) == [] ? false : true
  end

  def new
    @product = Product.new
  end

  def edit
  end

  def create
    @product = Product.new(product_params)
    @product.store_id = current_user.store.id

    respond_to do |format|
      if @product.save
        format.html { redirect_to @product, notice: 'Product was successfully created.' }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to @product, notice: 'Product was successfully updated.' }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @product.destroy
    respond_to do |format|
      format.html { redirect_to products_url, notice: 'Product was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def buy      
      Stripe.api_key = ENV['STRIPE_PRIVATEKEY']
      session = Stripe::Checkout::Session.create({
        payment_method_types: ['card'],
        mode: 'payment',
        success_url: success_url(params[:id]), 
        cancel_url: cancel_url(params[:id]),
        # what is being bought
        line_items: [ 
          {
            price_data: {
              currency: 'aud',
              product_data: {
                name: @product.name,
                description: @product.description,
              },
              unit_amount: (@product.price.to_f * 100).to_i  
            },
            quantity: 1
          }
        ]
        })
        
        render json: session
    # return @order
  end

  def success
  end
  
  def cancel
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    def product_params
      params.require(:product).permit(:name, :description, :availability, :category, :light, :difficulty, :price, :store_id, :image)
    end
end
