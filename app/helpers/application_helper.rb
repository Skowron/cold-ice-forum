module ApplicationHelper
  def icon( name, white = false )
    content_tag :i, "", :class => (white) ? "icon-#{name} icon-white" : "icon-#{name}"
  end

  def label_for_replies( topic )
    
  end

  def markdown(text)
    Redcarpet::Markdown.new(Redcarpet::Render::HTML.new(filter_html: true,no_styles: true)).render(text).html_safe
  end
end
