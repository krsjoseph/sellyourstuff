class ListingsController < ApplicationController
  before_action :set_listing, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:seller,:new, :create, :edit, :update, :destroy]
  before_filter :check_user, only: [:edit, :update, :destroy]


  def seller
    @listings = Listing.where(user: current_user).order("created_at DESC")
  end

  # GET /listings
  def index
    @listings = Listing.all
  end

  # GET /listings/1
  def show
  end

  # GET /listings/new
  def new
    @listing = Listing.new
  end

  # GET /listings/1/edit
  def edit
  end

  # POST /listings
  def create
    @listing = Listing.new(listing_params)
    @listing.user_id = current_user.id

    if @listing.save
      redirect_to @listing, notice: 'Listing was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /listings/1
  def update
    if @listing.update(listing_params)
      redirect_to @listing, notice: 'Listing was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /listings/1
  def destroy
    @listing.destroy
    redirect_to listings_url, notice: 'Listing was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_listing
      @listing = Listing.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def listing_params
      params.require(:listing).permit(:name, :description, :location, :image)
    end

    def check_user
      if current_user != @listing.user
        redirect_to root_url, alert: "Sorry, this listing belongs to someone else"
      end
    end
end
