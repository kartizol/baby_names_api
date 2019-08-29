class NameValidator < ActiveModel::Validator
  def validate(record)
    if !record.name.nil? && record.name.split(" ").length > 2
      record.errors.add(:name, 'Can contains only one space')
    end
  end
end