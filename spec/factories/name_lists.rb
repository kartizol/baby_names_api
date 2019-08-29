FactoryBot.define do
  factory :name_list do
    code { SecureRandom.hex(NameList::CODE_LENGTH).downcase }
  end
end
