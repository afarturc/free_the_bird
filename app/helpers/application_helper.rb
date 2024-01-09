module ApplicationHelper
  def selected_link(link_name)
    controller_name == link_name ? "text-black" : "text-gray-400"
  end

  def user_link(link_name)
    user_id = params[:id].to_i
    controller_name == link_name && current_user.id == user_id ? "text-black" : "text-gray-400"
  end

  def user_profile_tab_link(tab_link)
    controller_name == tab_link ? "border-black" : "text-gray-400"
  end
end
