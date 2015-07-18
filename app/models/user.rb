class User < ActiveRecord::Base
  has_secure_password
  has_many :auctions, dependent: :destroy
  has_many :bidits, dependent: :destroy
  has_many :bidit_auctions, through: :bidits, source: :auction
  def full_name
    "#{first_name} #{last_name}".strip.squeeze(" ")
  end
end
