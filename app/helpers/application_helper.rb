module ApplicationHelper
    def display_notice
        content_tag(:p, notice, class: "notice")
    end

    def display_alert
        content_tag(:p, alert, class: "alert")
    end

    def display_navbar_options
        if user_signed_in?
            render 'dropdown_options'
        else
            render 'login_buttons'
        end
    end
    
    def display_active_class(link_path)
        "active" if current_page?(link_path)
    end
end
