FactoryGirl.define do
  factory :disclosure do
    sequence(:title) { |n| "My invention#{n}'s title" }
    abstract "It does amazing things" * 10
    body "Here is a description of how it works" * 30
    consented true
  end

  factory :tag do
    sequence(:name) { |n| "Invention#{n}" }
  end

  factory :disclosure_tag do
    disclosure
    tag
  end
end
