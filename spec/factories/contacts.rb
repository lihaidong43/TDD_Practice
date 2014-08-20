# Read about factories at http://github.com/thoughtbot/factory_girl
require 'ffaker'

FactoryGirl.define do
  factory :contact do
    firstname Faker::Name.first_name

    lastname Faker::Name.last_name

    sequence(:email){|n| "lihaidong#{n}@163.com"}

    after_build do |contact|
      [:home,:work,:mobile].each do |phone_type|
        contact.phones << FactoryGirl.build(:phone,:type => phone_type,:contact => contact)
      end
    end

    factory :invalid_contact do
      firstname nil
    end
  end
end
