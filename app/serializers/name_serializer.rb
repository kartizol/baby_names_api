class NameSerializer < ActiveModel::Serializer
  attributes :id, :name, :crossed_out, :created_at
end
