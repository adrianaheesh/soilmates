class StoresController < ApplicationController
  before_action :set_store, except: [:new, :index, :create]
  before_action :set_store_owner, except: [:new, :index, :create]
  before_action :authenticate_user!, only: [:new, :create]
  before_action :redirect_if_not_store_owner, only: [:edit, :update, :destroy]
  before_action :redirect_if_user_has_store, only: [:new]

  def index
    @stores = Store.all
  end

  def show
    @store_review = StoreReview.new 
    @store_reviews = @store.store_reviews
    @store_ratings = @store.store_reviews.select(:rating)
    all_ratings = @store.store_reviews.pluck(:rating)
    @store_average_rating = (all_ratings.sum.to_f / all_ratings.length)
  end

  def new
    @store = Store.new
  end

  def edit
  end

  def create
    @store = Store.new(store_params)
    @store.user_id = current_user.id
    respond_to do |format|
      if @store.save
        format.html { redirect_to @store, notice: 'Store was successfully created.' }
        format.json { render :show, status: :created, location: @store }
      else
        format.html { render :new }
        format.json { render json: @store.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @store.update(store_params)
        format.html { redirect_to @store, notice: 'Store was successfully updated.' }
        format.json { render :show, status: :ok, location: @store }
      else
        format.html { render :edit }
        format.json { render json: @store.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @store.destroy
    respond_to do |format|
      format.html { redirect_to stores_url, notice: 'Store was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_store
      @store = Store.find(params[:id])
    end

    #assigns the owner of the current store (based on params)
    def set_store_owner
      @store_owner = @store.user_id
    end

    # stops user from creating more than one store
    def redirect_if_user_has_store
      if @user_owns_a_store
        redirect_to current_user.store, notice: 'Sorry, you already have a store'
      end
    end
    
    def redirect_if_not_store_owner
      # redirect users who dont have a store
      if @user_owns_a_store == false
        redirect_to stores_path, notice: 'Sorry, only the store owner can do this'
      end
      # redirect users who don't own the store
      if user_signed_in? && @store.id != current_user.store.id
        redirect_to stores_path, notice: 'Sorry, only the store owner can do this'
      end
    end

    def store_params
      params.require(:store).permit(:name, :description, :user_id, :banner)
    end
end
