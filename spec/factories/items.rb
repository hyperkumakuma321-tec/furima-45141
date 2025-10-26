FactoryBot.define do
  factory :item do
    name              {Faker::Name.initials(number: 2)}
    explanation       {Faker::Lorem.sentence}
    status_id         {2}
    category_id       {2}
    shipping_fee_id   {3}
    prefecture_id     {3}
    shipping_day_id   {2}
    price             {1000}
    association :user
    trait :with_image do
      after(:build) do |item|
        item.image.attach(
          io: File.open(Rails.root.join('spec/fixtures/files/test_image.jpg')),
          filename: 'test_image.jpg',
          content_type: 'image/jpg'
        )
      end
    end
  end
end
