FactoryGirl.define do
  factory :post do
    title "Cheese collection"
    url  "http://cheese.example.com"
    user
  end
end