require 'rails_helper'

RSpec.describe BiditsController, type: :controller do
  let(:auction) { create(:auction) }
describe "#create" do
  context "with valid params" do
    def valid_request
      post :create, { auction_id: auction.id,bidit: {price: 100 } }
    end
    it "creates a bidit in the DB" do
      expect{valid_request}.to change{ Bidit.count }.by(1)
    end
    it "associates the bidit with the auction" do
      valid_request
      expect(Bidit.last.auction).to eq(auction)
    end
    it "redirects to the auction show page" do
      valid_request
      expect(response).to redirect_to(auction_path(auction))
    end
  end
  context "with invalid request" do
    def invalid_request
             post :create, { auction_id: auction.id,bidit: {price: "f" } }
    end
   it "doesn't create a new bidit record" do
      expect{ invalid_request }.to change{ Bidit.count }.by(0)
    end
    it "redirects to the auction show page" do
      invalid_request
      expect(response).to render_template("auctions/show")
    end
    it "sets a flash alert message" do
      invalid_request
      expect(flash[:alert]).to be
    end
  end
end
end
