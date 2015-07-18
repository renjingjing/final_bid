class BiditsController < ApplicationController
   before_action :authenticate_user!


      def create
        bidit_params = params.require(:bidit).permit(:price)
        @auction = Auction.find params[:auction_id]
        @bidit = Bidit.new bidit_params
        @bidit.auction = @auction
        @bidit.user = current_user
        respond_to do |format|
        if @auction.user != current_user
            @bidit.save!
            # redirect_to @auction, notice: "You bid it,please make the payment"
            if (@auction.aasm_state == 'reserve_met') && (@bid.price >= @auction.reserved_price)
               @auction.reserve_was_meet!
            end
            format.html { redirect_to @auction }
            format.js { render }
        else
          #  redirect_to @auction, alert: "You cannot bid on your own auction!"
            format.html { redirect_to @auction, alert: "You cannot bid on your own auction!" }
            format.js {render js: "alert('failure');"}
        end
      end
    end



end
