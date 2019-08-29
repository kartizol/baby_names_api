class NameList < ApplicationRecord
  CODE_LENGTH = 6

  before_create :set_code

  validates :code,
            uniqueness: true

  has_many :names

  private

  def set_code
    self.code = generate_code
  end

  def generate_code
    loop do
      check_code = SecureRandom.hex(CODE_LENGTH).downcase
      break check_code unless NameList.exists?(code: check_code)
    end
  end
end
