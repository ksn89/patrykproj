json.array!(@projects) do |project|
  json.extract! project, :id, :name, :user_name
  json.url project_url(project, format: :json)
end
