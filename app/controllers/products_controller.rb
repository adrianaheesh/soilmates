class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy, :buy, :favorite]
  
  # set the store that owns the product
  before_action :set_products_store, only: [:show, :edit, :update, :destroy, :buy, :favorite]

  # user must be signed in for everything except show and index
  before_action :authenticate_user!, except: [:index, :show]

  # redirect if user is not the store manager for the product
  before_action :redirect_non_store_owner, only: [:edit, :udpate, :destroy]

  def index
    puts "YOYOY"
    p current_user.store
    @products = Product.all
  end

  def show
    puts "YOYOY"
    p current_user.store.id
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
  end
  
  def cancel
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    def set_products_store
      store_id_of_product = @product.store_id
      @store_that_owns_product = Store.find(store_id_of_product)
      puts "YOOOO"
      pp @store_that_owns_product
      pp @store_that_owns_product.user_id
    end

    def redirect_non_store_owner
      redirect_action = redirect_to products_path, notice: 'Sorry, only the store owner can do this'
      if @user_owns_a_store == false # does the user own a store
        redirect_action
      else @store_that_owns_product.user_id != current_user.id
        puts "HEYO"
        redirect_action
      end
    end

    def product_params
      params.require(:product).permit(:name, :description, :availability, :category, :light, :difficulty, :price, :store_id, :image)
    end
end
