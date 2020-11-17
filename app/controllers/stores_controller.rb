class StoresController < ApplicationController
  before_action :set_store, except: [:new, :index, :create]

  #setting the user id of the store owner
  before_action :set_store_owner, except: [:new, :index, :create]

  #setting the current users store
  # before_action :set_current_users_store

  #only users with accounts can create a new store
  before_action :authenticate_user!, only: [:new, :create]

  #redirecting store owners who attempt to make a second store
  before_action :redirect_if_user_has_store, only: [:new]

  #redirecting users who are not the owners of the store
  before_action :redirect_if_not_store_owner, only: [:edit, :update, :destroy]

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
    if !@store_owner
      @store = Store.new
    end
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

    # # return the current users store
    # def set_current_users_store
    #   if user_signed_in?
    #     @current_users_store = Store.find_by_user_id(current_user.id)
    #   end
    # end

    def redirect_if_user_has_store
      if @current_users_store
        redirect_to @current_users_store, notice: 'Sorry, you already have a store'
      end
    end
    
    def redirect_if_not_store_owner
      if @current_users_store != current_user.id
        redirect_to stores_path, notice: 'Sorry, only the store owner can do this'
      end
    end

    def store_params
      params.require(:store).permit(:name, :description, :user_id, :banner)
    end
end
