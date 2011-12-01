# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :showroom do
      user { |c| c.association(:user) }
      type "Bedroom"
    end
end

FactoryGirl.define do
  factory :bedroom, :parent => :showroom do
      user { |c| c.association(:user) }
      type "Bedroom"
    end
end

FactoryGirl.define do
  factory :livingroom, :parent => :showroom do
      user { |c| c.association(:user) }
      type "Livingroom"
    end
end