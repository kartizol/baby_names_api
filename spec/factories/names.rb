FactoryBot.define do
  factory :name do
    name { Faker::Name.unique.first_name }
    crossed_out { false }
    name_list { nil }
  end
end
