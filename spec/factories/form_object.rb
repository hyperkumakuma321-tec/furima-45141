FactoryBot.define do
  factory :form_object do
    postnumber { '123-4567' }
    prefecture_id { 2 }
    municipality { '東京都' }
    street_address { '渋谷区1-1' }
    building { 'テストビル' }
    tel { '09012345678' }
  end
end