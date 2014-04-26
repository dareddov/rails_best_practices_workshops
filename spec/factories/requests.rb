# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :request do
    owner_id nil
    name "MyString"
    description "MyText"
  end
end
