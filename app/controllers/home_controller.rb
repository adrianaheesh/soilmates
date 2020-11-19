class HomeController < ApplicationController
  def page
    @stores = Store.paginate(page: params[:page], per_page: 3)
    @new_products = Product.order("created_at DESC").take(4)
    @plants = Product.find_by_category("Plant")
    @easy_plants = Product.find_by_difficulty("Plant beginner")
    @medium_plants = Product.find_by_difficulty("Mildly smug") 
    @difficult_plants = Product.find_by_difficulty("Full blown #plantfluencer")
  end
end
