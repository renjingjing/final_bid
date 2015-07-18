class AuctionsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_auction, only: [:edit, :update,:show ,:destroy]

  def index
    @auctions = Auction.order(end_on: :desc)
  end

  def new
    @auction = Auction.new
  end

  def create
    @auction = Auction.new auction_params
    @auction.user = current_user
    if @auction.save
    redirect_to auction_path(@auction), notice: "Auction created!"
    else
    flash[:alert]="Can't create Auction"
    render :new
    end
  end

  def show
    @bidit = Bidit.new
  end

  def edit
  end

  def update
    if @auction.update auction_params
      redirect_to auction_path(@auction), notice: "Auction updated!"
    else
      flash[:alert] = "Cannot update!"     
      render :edit
    end
  end

  def destroy
    if @auction.destroy
      redirect_to auctions_path
    else
      flash[:alert]
      render :show
    end
  end


  private

  def find_auction
    @auction = Auction.find params[:id]
  end

  def auction_params
  params.require(:auction).permit(:name,:description,:end_on)
  end
end
