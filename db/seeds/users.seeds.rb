User.find_or_create_by(email: "reader@example.com") do |user|
  user.password = "123456"
  user.role = "reader"
  user.last_name = "Обычный"
  user.first_name = "Пользователь"
end

User.find_or_create_by(email: "admin@example.com") do |user|
  user.password = "123456"
  user.role = "admin"
  user.last_name = "Мощный"
  user.first_name = "Пользователь"
end

User.find_or_create_by(email: "superadmin@example.com") do |user|
  user.password = "123456"
  user.role = "superadmin"
  user.last_name = "Полномощный"
  user.first_name = "Пользователь"
end
