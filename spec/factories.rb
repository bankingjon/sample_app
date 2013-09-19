FactoryGirl.define do
  factory :user do
    sequence(:name)  { |n| "Person #{n}" }
    sequence(:email) { |n| "person_#{n}@example.com"}
    password "foobar"
    password_confirmation "foobar"

    factory :admin do
    	admin true
    end
  end

  factory :micropost do
  	content "Lorem ipsum"
  	user
  end

  factory :campaign do
    name "Fall Campaign 2013"
    drop_date "6/1/2013"
    client_id "1"
    mp_managed "0"
  end

  factory :appeal do
    client_file_id  "12345" 
    ask1            "10.00"
    ask2            "25.00"
    ask3            "100.75"
    mailcode        "DM0001"
    scanline        "00129301M00M19201S"
    tier            "1"
    tiercode        "M1280"
    mailtype        "First Class"
    campaign
  end

end