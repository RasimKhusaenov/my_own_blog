class ArticleDecorator < BaseDecorator
  def button_color
    published? ? "secondary" : "outline-light"
  end

  def date
    created_at.strftime("%B %d, %Y")
  end

  def preview
    content.truncate(43)
  end

  def card_styles
    "bg-secondary" unless published?
  end
end
