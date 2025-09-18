Prairie Home Essentials Store

Prairie Home Essentials is a small e‑commerce application built with Ruby on Rails. The goal of this project is to demonstrate how to build a simple yet elegant online store with catalog browsing, a shopping cart, and a basic checkout process. It also includes an administrative interface (powered by ActiveAdmin
) to manage products, categories and static pages.

This repository is intended for learning purposes. You can run the app locally to explore the code, experiment with Ruby on Rails, or adapt it as a starting point for your own project.

Features

Product catalog – View a list of products with names, descriptions, prices and images. Products can belong to multiple categories.

Search & filtering – Search products by keyword and filter them by category. Search and filter options are always available at the top of the catalog.

Responsive layout – The UI is built with Bootstrap 5 for a modern, mobile‑friendly design. Cards include hover effects, and the site uses a clean font for readability.

Shopping cart – Add products to a cart, see quantities and subtotals, remove items or empty the cart completely.

Checkout flow – Review cart contents and place an order by submitting a simple form. (No payment processing is implemented.)

Admin backend – Administrators can create, edit and delete products, categories and static pages through a secure admin panel using ActiveAdmin.

Static pages – Use the Pages feature to add content such as About or Contact pages; link to them from the footer.

Seed data – The repository includes seed data to populate products and categories for testing.

Getting Started

Follow these steps to run the application on your local machine.

Prerequisites

Ruby 3.1 or later – Install via rbenv
 or RVM
.

Bundler – Install with gem install bundler if it isn’t already.

SQLite – Rails uses SQLite by default; ensure it’s installed on your system.

Node.js & Yarn (optional) – Only required if you switch from import maps to Webpacker or another JS bundler.

Installation

Clone the repository

git clone https://github.com/atanwar-rrc/prairie_home_essentials_store.git
cd prairie_home_essentials_store


Install the gems

bundle install


Set up the database

Run the following to create the database, run migrations and load the seed data:

bin/rails db:setup


If you only need to run migrations (without seeding), use bin/rails db:migrate.

Start the server

bin/rails server


The application will be accessible at http://localhost:3000
.

Access the admin panel

Visit http://localhost:3000/admin.

The default admin user credentials are configured in the seed file. Open db/seeds.rb to see the username and password or change them before running db:setup.

Usage

Once the server is running, you can explore the following:

Browse products from the Products link in the navbar. Use the search box or category dropdown to filter the listing. Click on a product card to view its details.

Add to cart by clicking the Add to Cart button on a product card. Open the cart from the navbar to see what you’ve added, adjust quantities or remove items.

Check out by proceeding to the checkout page from the cart. Enter a name and place your order. The order summary resets the cart on completion.

Admin management – Log into the admin panel to add or modify products, categories or pages. The admin panel uses ActiveAdmin’s standard interface.

Customisation

Here are a few ways to modify the store to suit your needs:

Styling – The application uses Bootstrap 5 and a custom CSS file in app/assets/stylesheets/application.css. You can tweak the colour palette, typography or card styles by editing this file. Feel free to replace the Google Fonts import with your preferred font.

Images – Product images are loaded from external URLs defined in the seed data. To use your own images, upload files into app/assets/images and update the image_url attribute of each product accordingly.

Pages – The Page model allows you to create static pages with a title, slug and body (HTML). Add pages like About Us, FAQ or Contact, and link to them from the footer.

Tests – To ensure your changes don’t break functionality, consider adding unit and integration tests using RSpec or Minitest. Rails makes it easy to test controllers, models and views.

Contributing

Contributions are welcome! If you find a bug or have an improvement, please open an issue or submit a pull request. When contributing, follow these guidelines:

Fork the repository and create a new branch for your feature or bug fix.

Write descriptive commit messages and keep changes focused.

Add tests for new functionality when possible.

Submit a pull request describing your changes and the motivation behind them.

License

This project is licensed under the MIT License. See the LICENSE file for more details.

Acknowledgements

This project was developed for educational purposes at Red River College Polytechnic. It uses Bootstrap and ActiveAdmin under their respective licenses. Feel free to build upon it, adapt it for your own projects, and share it with others.