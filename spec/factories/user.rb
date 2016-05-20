FactoryGirl.define do
  factory :user, class: User do
    email 'example@example.com'
    password 'password'
  end

  factory :ichiro, class: User do
    email 'example01@example.com'
    password 'password'
  end

  factory :jiro, class: User do
    email 'example02@example.com'
    password 'password'
  end
end