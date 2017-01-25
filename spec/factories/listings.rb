FactoryGirl.define do
  factory :listing do
    listed_at "2017-01-24 21:35:31"
    address "MyString"
    latitude "9.99"
    longitude "9.99"
    heading "MyString"
    description "MyString"
    discriminatory false
  end
end
