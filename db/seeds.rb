# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
first_user = User.new(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.')
first_user.save
first_post = Post.new(author: first_user, title: 'Hello', text: 'This is my first post')
first_post.save
Comment.new(post: first_post, author: first_user, text: 'Hi Tom!' )
Comment.new(post: first_post, author: first_user, text: 'Hi Tom 2!' )
Comment.new(post: first_post, author: first_user, text: 'Hi Tom 3!' )
Comment.new(post: first_post, author: first_user, text: 'Hi Tom 4!' )
Comment.new(post: first_post, author: first_user, text: 'Hi Tom 5!' )
Comment.new(post: first_post, author: first_user, text: 'Hi Tom 6!' )

