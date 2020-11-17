class ApplicationController < ActionController::Base
    include ApplicationHelper
    before_action :set_current_users_store 
    before_action :set_user_owns_a_store

    def favorite_text
        return @favorite_exists ? "Unfavourite" : "Add to favourites"
    end

    helper_method :favorite_text

    private
    def set_user_owns_a_store
        # returns true if the current user has a store
        @user_owns_a_store = false
        if user_signed_in? && @current_user_store && current_user.id == @current_user_store.user_id
            @user_owns_a_store = true
        end
    end

    # return the current users store
    def set_current_users_store
        if user_signed_in?
          @current_users_store = Store.find_by_user_id(current_user.id)
          puts "EYEY"
          pp @current_users_store # currently = 32 aka Plant Posse
        end
      end
  end
