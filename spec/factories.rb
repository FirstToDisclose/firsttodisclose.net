FactoryGirl.define do
  factory :collection_innovation do

  end

  factory :collection do
    title "My Collection"
  end

  factory :review do

  end

  factory :identity do
    user nil
    provider "MyString"
    uid "MyString"
  end

  factory :user do
    sequence(:email) { |n| "user#{n}@example.com" }
    password "password"
    reviewer false
  end

  factory :innovation do
    sequence(:title) { |n| "My invention#{n}'s title" }
    abstract "It does amazing things" * 10
    body "Here is a description of how it works" * 30
    consented true
  end

  factory :revision do
    innovation
    user
    title "A newer title for my innovation"
    abstract "It does different things" * 10
    body "Here is an altered description of how it works" * 30
    consented true
  end

  factory :tag do
    sequence(:name) { |n| "Invention#{n}" }
  end

  factory :innovation_tag do
    innovation
    tag
  end
end
