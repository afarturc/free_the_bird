module ApplicationHelper
  def selected_link(link_name)
    controller_name == link_name ? "text-black" : "text-gray-400"
  end
end
