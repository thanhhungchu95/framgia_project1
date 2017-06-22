module ApplicationHelper
  def full_title_for page_title = ""
    if page_title.empty?
      t ".title"
    else
      page_title << " | " << t(".title")
    end
  end
end
