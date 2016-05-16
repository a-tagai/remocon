FactoryGirl.define do
  factory :ichiro, class: User do
    email 'example01@example.com'
    password 'password'
  end

  factory :jiro, class: User do
    email 'example02@example.com'
    password 'password'
  end
end