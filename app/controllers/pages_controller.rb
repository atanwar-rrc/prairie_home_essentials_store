class PagesController < ApplicationController
  # Render a static page by its slug. The slug is passed via a default
  # parameter in routes (e.g. /about sets slug: "about"). If no page is
  # found, ActiveRecord::RecordNotFound will be raised and a 404 page
  # will be displayed by Rails.
  def show
    @page = Page.find_by!(slug: params[:slug])
  end
end
