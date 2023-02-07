module ApplicationHelper
    def display_notice
        content_tag(:p, notice, class: "notice")
    end

    def display_alert
        content_tag(:p, alert, class: "alert")
    end

    def display_navbar_options
        if user_signed_in?
            render 'loggedInNav'
        else
            render 'loggedOutNav'
        end
    end
    
    
    def display_active_class(link_path)
        "active" if current_page?(link_path)
    end
end
