class ApplicationController < ActionController::API

    def user_id_from_fb_id(fbid) 
        User.find_by(fb_id: fbid)
    end
    
end
