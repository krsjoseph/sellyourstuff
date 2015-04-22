class PagesController < ApplicationController
  def index
    @listings = Listing.all.order("created_at DESC")
  end
end