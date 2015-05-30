FactoryGirl.define do

  factory :event_membership do
    event
    user
  end

  factory :event do
    start_time Date.today + 1.day
    end_time Date.today + 3.days
    title "My New Hackathon"
    street_1 "66 Kenzel Ave"
    street_2 "Apt 2"
    city "Nutley"
    state "NJ"
    country "United States"
    postal_code "07110"
    user
  end

  factory :live_page do
    hangout_url "https://plus.google.com/hangouts/_/calendar/amFzb253YWxzaEBnbWFpbC5jb20.u9mdnlukpn0hnps53sd38l258k?authuser=0"
  end

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
    accepted_terms true
  end

  factory :innovation do
    user
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
