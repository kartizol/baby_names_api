class Name < ApplicationRecord
  belongs_to :name_list

  auto_strip_attributes :name

  validates :name,
            presence: true,
            length: { minimum: 1, maximum: 50 },
            format: { with: /\A[a-zA-Z\s]+\z/ },
            uniqueness: { scope: :name_list_id }
  validates_with NameValidator
end
