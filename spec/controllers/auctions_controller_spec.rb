require 'rails_helper'

RSpec.describe AuctionsController, type: :controller do

  describe "#new" do
    it "renders the new template" do
      get :new
      expect(response).to render_template(:new)
    end

    it "instantiates a new Auction variable" do
      get :new
      expect(assigns(:auction)).to be_a_new Auction
    end
  end

  describe "#create" do
    context "with valid parameters" do
      def valid_request
        post :create, { auction: {name: 'My auction', descriptions: 'This is index descriptions',
        end_on: DateTime.current + 7.days } }
      end
      it "changes the auction count by +1" do
        expect{ valid_request }.to change{ Auction.count }.by(1)
      end
      it "sets a flash notice message and redirects to the new auction show page" do
        valid_request
        expect(response).to redirect_to auction_path(Auction.last)
      end
    end

    context "with invalid parameters" do
      def invalid_request
          post :create,  { auction: {name: '', description: 'This is index descriptions',
            end_on: DateTime.current + 7.days } }
      end
      it "renders the new form" do
        invalid_request
        expect(response).to render_template(:new)
      end

      it "doesn't change the auctions count" do
        expect {invalid_request}.to_not change { Auction.count }
      end

      it "sets a flash alert message" do
        invalid_request
        expect(flash[:alert]).to be
      end
    end
  end

end
