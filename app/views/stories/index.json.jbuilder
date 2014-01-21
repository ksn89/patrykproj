json.array!(@stories) do |story|
  json.extract! story, :id, :name, :project_id, :status, :description, :story_type, :owner
  json.url story_url(story, format: :json)
end
