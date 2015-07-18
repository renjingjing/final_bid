class Auction < ActiveRecord::Base
    belongs_to :user
    validates  :name, presence: true
    has_many   :bidits, dependent: :destroy
    has_many    :bidits_users, through: :bidits, source: :user

    include AASM
    aasm do
      state :published, initial: true
      state :reserve_met
      state :won
      state :canceled
      state :reserve_not_met
      event :reserve_was_meet do
      transitions from: :published, to: :reserve_met
      end
    end

    def current_price
      if bidits.length > 0
        bidits.order(price: :desc).first.price + 1 || 0
      else
        0
      end
    end

    def highest_bidit
      bidits.order(price: :desc).first if aasm_state == "reserve_met"
    end
end
