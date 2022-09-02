# README
![](https://img.shields.io/badge/Microverse-blueviolet)

# Rails blog

> My first rails project during Microverse.

A classic example of a blog website. A fully functional website that will show the list of posts and empower readers to interact with them by adding comments and liking posts. Built with Ruby on Rails.

## Built With

- Ruby
- Ruby on Rails
- Rubocop, stylelint, heroku actions

## Getting Started

To get a local copy up and running follow these simple example steps.
## 🛠 Installation & Set Up

1. Install Gems

   ```sh
   bundle install
   ```

2. Start the development server

   ```sh
    rails s
   ```


### Prerequisites

### Setup

### Install
The following tools help make easier to work with sample code.

- [git](https://git-scm.com/downloads): A tool for managing source code
- [Visual Studio Code](https://code.visualstudio.com/): A source code editor
- [NVM](https://github.com/nvm-sh/nvm)
- [Ruby](https://www.ruby-lang.org/en/documentation/installation/)
- [Rails](https://www.digitalocean.com/community/tutorials/how-to-install-ruby-on-rails-with-rbenv-on-ubuntu-20-04)

## Authors

👤 **Temitope Ogunleye**

- GitHub: [@topeogunleye](https://github.com/topeogunleye)
- Twitter: [@tope_leye](https://twitter.com/tope_leye)
- LinkedIn: [ogunleye](https://linkedin.com/in/ogunleye)

👤 **Jason Felix**

- GitHub: [@jasonfelice](https://github.com/jasonfelice)
- LinkedIn: [LinkedIn](https://www.linkedin.com/in/jake-felice/)

## 🤝 Contributing

Contributions, issues, and feature requests are welcome!

Feel free to check the [issues page](../../issues/).

## Show your support

Give a ⭐️ if you like this project!

## Acknowledgments

- Hat tip to anyone whose code was used
- Inspiration
- etc

## 📝 License

This project is [MIT](./MIT.md) licensed.

first_user = User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.')

first_post = Post.create(author_id: first_user.id, title: 'Hello', text: 'This is my first post', comment_counter: 0, like_counter: 0)









