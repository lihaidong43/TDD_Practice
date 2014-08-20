# Read about factories at http://github.com/thoughtbot/factory_girl

require 'ffaker'
FactoryGirl.define do
  factory :phone do
    association :contact
    type ""
    number {Faker::PhoneNumber.phone_number}
  end
end
