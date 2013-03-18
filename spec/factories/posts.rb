FactoryGirl.define do
  factory :post do
    url "http://www.example.com"
    title "MyString"
    
    user
  end

  factory :invalid_post, parent: :post do
  	url "Invalid url"
  end
end