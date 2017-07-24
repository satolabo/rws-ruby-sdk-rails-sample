FactoryGirl.define do
  factory :rws_ichiba_item, class: "RakutenWebService::Ichiba::Item" do
    skip_create
    initialize_with { new(attributes) }
  end
end
