class PersonSerializer < AbstractSerializer
  attributes :dni, :first_name, :last_name, :phone, :address, :email, :gender, :picture_url
end