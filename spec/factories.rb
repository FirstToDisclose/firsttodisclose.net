FactoryGirl.define do
  factory :disclosure do
    sequence(:title) { |n| "My invention#{n}" }
    abstract "It does amazing things"
    body "Here is a description of how it works"
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
