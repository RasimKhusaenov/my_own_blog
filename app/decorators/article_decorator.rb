class ArticleDecorator < SimpleDelegator
  def self.wrap(collection)
    collection.map do |obj|
      new obj
    end
  end

  def preview
    content.truncate(43)
  end

  def card_color
    @card_color ||= published? ? "dark" : "secondary"
  end
end
