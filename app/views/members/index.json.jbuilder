json.array!(@members) do |member|
  json.extract! member, :id, :member_name
  json.url member_url(member, format: :json)
end
