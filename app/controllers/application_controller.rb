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
    # if @current_users_store != nil
        # && current_user.id == @current_users_store.user_id
        # @user_owns_a_store = true
    
    # return the current users store or nil if none
    # def set_current_users_store
    #     @user_owns_a_store = false
    #     if user_signed_in? 
    #         # check for store
    #         current_user.store.id ? @user_owns_a_store = true : @user_owns_a_store = false
    #         if @user_owns_a_store

    #         puts "LOOK HERE"
    #         pp @user_owns_a_store
    #       puts "or maybe here"
    #       pp @current_users_store
    #     end
    #   end


      # check if a user is signed
      # check if the signed in user has a store
      # if they have a store, set the current_user.store.id
 
  end
