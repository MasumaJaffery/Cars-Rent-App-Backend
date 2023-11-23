class UserSerializer
  include JSONAPI::Serializer
  attributes :id, :name, :email, :created_at
end
