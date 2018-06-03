module ApplicationHelper

  def head_title(page_title="")
    base_title = "RailsApp"

    if page_title.empty?
      base_title
    else
      "#{page_title} | #{base_title}"
    end
  end

end
