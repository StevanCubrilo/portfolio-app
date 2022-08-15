module ApplicationHelper
    def login_helper
            if current_user.is_a?(User) 
             button_to 'Logout', destroy_user_session_path, method: :delete 
            else 
             (button_to 'Sign up', new_user_registration_path, method: :get) +
             (button_to 'Login', new_user_session_path, method: :get)
            end 
    end

    def source_helper(layout_name)
        if session[:source] 
            greeting = "Thanks for visiting me from #{session[:source]} and you are on #{layout_name} layout" 
            content_tag(:p, greeting, class: "source-greeting" )
        end 
    end
end
