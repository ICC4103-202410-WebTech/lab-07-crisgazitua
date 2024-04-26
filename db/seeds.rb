# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
User.destroy_all
Post.destroy_all
Tag.destroy_all

# Create 5 Users
5.times do |i|
  User.create!(
    name: "User #{i + 1}",
    email: "user#{i + 1}@example.com",
    password: "password"
  )
end

# Fetch all users
users = User.all

# Create 5 Tags
5.times do |i|
  Tag.create!(name: "Tag #{i + 1}")
end

# Fetch all tags
tags = Tag.all

# Create 10 Posts
10.times do |i|
  post = Post.create!(
    title: "Post #{i + 1}",
    content: "Content for Post #{i + 1}",
    user: users.sample, 
    published_at: Time.current
  )

  post.tags << tags.sample # Randomly assign a tag to a post
end

tags.each do |tag|
  Post.first.tags << tag unless Post.first.tags.include?(tag)
end
