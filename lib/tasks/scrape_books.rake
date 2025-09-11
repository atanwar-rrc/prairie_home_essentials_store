# lib/tasks/scrape_books.rake
namespace :scrape do
  desc "Scrape categories & products from https://books.toscrape.com (Task 1.7)"
  task books: :environment do
    require 'nokogiri'
    require 'open-uri'
    require 'uri'

    base = 'https://books.toscrape.com/'
    start_url = base

    puts "==> Scraping categories from #{start_url}"

    begin
      home_doc = Nokogiri::HTML(URI.open(start_url))
    rescue => e
      puts "Failed to open #{start_url}: #{e.message}"
      exit 1
    end

    # Grab category names + urls
    categories = home_doc.css('.side_categories ul li ul li a').map do |a|
      [a.text.strip, URI.join(base, a['href']).to_s]
    end

    puts "Found #{categories.size} categories"

    categories.each do |cat_name, cat_url|
      category = Category.find_or_create_by!(name: cat_name)
      puts "\n==> Category: #{cat_name}"

      page_url = cat_url

      loop do
        puts "Scraping page: #{page_url}"
        begin
          page = Nokogiri::HTML(URI.open(page_url))
        rescue => e
          puts "  Error loading #{page_url}: #{e.message}"
          break
        end

        # Each product on the list page
        page.css('ol.row li').each do |li|
          title = li.at_css('h3 a')['title'].strip
          price_text = li.at_css('.price_color').text.gsub(/[^\d.]/, '')
          price = price_text.to_f

          relative_product_url = li.at_css('h3 a')['href']
          product_url = URI.join(page_url, relative_product_url).to_s

          # Open the product page to get description + image
          begin
            product_doc = Nokogiri::HTML(URI.open(product_url))
          rescue => e
            puts "  Error loading product #{product_url}: #{e.message}"
            next
          end

          description = product_doc.at_css('#product_description ~ p')&.text.to_s
          image_rel   = product_doc.at_css('.item.active img')['src']
          image_url   = URI.join(base, image_rel).to_s

          product = Product.find_or_initialize_by(name: title)
          product.description = description.presence || "No description provided."
          product.price       = price
          product.stock     ||= rand(5..200)
          product.image_url   = image_url # keep using your existing column
          if product.changed?
            product.save!
            puts "  + #{product.name} (#{price})"
          end

          # attach category (avoid duplicates)
          product.categories << category unless product.categories.exists?(id: category.id)
        end

        # Pagination: look for "next" link
        next_link = page.at_css('li.next a')
        break unless next_link
        page_url = URI.join(page_url, next_link['href']).to_s
      end
    end

    puts "\n== DONE =="
    puts "Products:   #{Product.count}"
    puts "Categories: #{Category.count}"
  end
end
