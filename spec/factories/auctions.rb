FactoryGirl.define do
  factory :auction do
    sequence(:name)     { |n| "Auction Name #{n}"}
    sequence(:description)  { |n| "Auction Descriptions #{n}" }
    end_on            DateTime.current + 7.days
  end
end
