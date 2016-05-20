module ApplicationHelper
    def welcome
        if member_signed_in?
            "Welcome to KatTracker, #{current_member.username.present? ? current_member.username : current_member.email}!"
        else
            "Welcome to KatTracker!"
        end
    end
    
end
