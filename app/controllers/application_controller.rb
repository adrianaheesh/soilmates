class ApplicationController < ActionController::Base
    def favorite_text
        return @favorite_exists ? "Remove from favourites" : "Add to favourites"
    end

    helper_method :favorite_text
end
