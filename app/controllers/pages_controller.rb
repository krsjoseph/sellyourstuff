class PagesController < ApplicationController
  def index
    @listings = Listing.last(3)
  end
end