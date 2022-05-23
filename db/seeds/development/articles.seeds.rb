Article.find_or_create_by(title: "Welcome to the My Own Blog!") do |article|
  article.content = "It is already now!"
  article.published = true
end

Article.find_or_create_by(title: "To be, or not to be?") do |article|
  article.content = "That is the question"
  article.published = false
end
