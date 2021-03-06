class ApplicationController < ActionController::Base
    include ApplicationHelper
    # before_action :set_current_users_store 
    before_action :set_user_owns_a_store

    def favorite_text
        return @favorite_exists ? "Unfavourite" : "Add to favourites"
    end

    helper_method :favorite_text

    private
    # returns true if the current user has a store
    def set_user_owns_a_store
        @user_owns_a_store = false
        if user_signed_in? 
            #check for store
            return current_user.store ? @user_owns_a_store = true : @user_owns_a_store = false
        end
    end
  end
