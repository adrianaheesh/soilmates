class ApplicationController < ActionController::Base
    include ApplicationHelper
    before_action :set_current_users_store 
    before_action :set_user_owns_a_store

    def favorite_text
        return @favorite_exists ? "Unfavourite" : "Add to favourites"
    end

    helper_method :favorite_text

    private
    # returns true if the current user has a store
    def set_user_owns_a_store
        @user_owns_a_store = false
        # if user_signed_in? && @current_users_store 
        if @current_users_store != nil
            # && current_user.id == @current_users_store.user_id
            @user_owns_a_store = true
        end
    end

    # return the current users store or nil if none
    def set_current_users_store
        if user_signed_in?
          @current_users_store = Store.find_by_user_id(current_user.id)
          puts "EYEY"
          pp @current_users_store
        end
      end
  end
