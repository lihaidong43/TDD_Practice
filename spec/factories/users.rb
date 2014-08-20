# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do

    sequence(:email){|n| "lihaidong#{n}@163.com"}

    password 'secret'

    admin false

    factory :admin do
      admin true
    end

  end
end
