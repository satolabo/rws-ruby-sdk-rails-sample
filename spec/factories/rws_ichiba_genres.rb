FactoryGirl.define do
  factory :rws_ichiba_genre, class: "RakutenWebService::Ichiba::Genre" do
    sequence(:genreId)
    
    skip_create
    initialize_with { new (attributes) }

    trait :root do
      genreId RWS::Ichiba::Genre.root_id
    end
  end
end
