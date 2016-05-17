module ApplicationHelper
    def welcome
        if member_signed_in?
            "Welcome to Catfish Caddie, #{current_member.full_name.present? ? current_member.full_name : current_member.email}!"
        else
            "Welcome to Catfish Caddie!"
        end
    end
    
end
