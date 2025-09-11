# config/initializers/active_admin.rb

ActiveAdmin.setup do |config|
  # == Site Title
  config.site_title = "Prairie Home Essentials Store"

  # == Authentication & Current User
  config.authentication_method = :authenticate_admin_user!
  config.current_user_method = :current_admin_user

  # == Logging Out
  config.logout_link_path = :destroy_admin_user_session_path

  # == Admin Comments
  #
  # Disable ActiveAdmin’s built‑in comments.  Without disabling comments,
  # visiting /admin/comments or rendering comment sections on resource
  # pages will raise routing errors (e.g., No route matches {:scope=>"all"}).
  config.comments = false

  # == Sensitive Attributes Filter
  config.filter_attributes = [:encrypted_password, :password, :password_confirmation]

  # == Localize Date/Time Format
  config.localize_format = :long

  # == Download Links
  #
  # ActiveAdmin adds a “Download as CSV” link to every resource index by default,
  # but this application doesn’t define CSV routes.  Without disabling these links,
  # visiting index pages raises a UrlGenerationError (No route matches {:format=>:csv}).
  config.namespace :admin do |admin|
    admin.download_links = false
  end

  # ... the rest of the generated initializer (menu, filters, pagination, etc.)
end
