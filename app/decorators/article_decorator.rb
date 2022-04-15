class ArticleDecorator < BaseDecorator
  def preview
    content.truncate(43)
  end

  def card_color
    @card_color ||= published? ? "dark" : "secondary"
  end
end
