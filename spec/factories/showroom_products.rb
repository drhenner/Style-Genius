# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :showroom_product do
      showroom      { |c| c.association(:showroom) }
      product       { |c| c.association(:product) }
      stylist       { |c| c.association(:stylist) }
      note "MyString"
      active false
    end
end