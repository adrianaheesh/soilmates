class StoreReviewsController < ApplicationController
  before_action :set_store
  before_action :authenticate_user!

  def create
    @store_review = @store.store_reviews.new(store_review_params)
    @store_review.user = current_user
    @store_review.save!
    redirect_back(fallback_location: root_path)
  end

  private
  def set_store
    @store = Store.find(params[:store_id])
  end

  def store_review_params
    params.require(:store_review).permit(:rating, :comment, :store_id, :user_id)
  end
end
