json.array!(@assignees) do |assignee|
  json.extract! assignee, :id, :name, :address, :city, :state, :zip, :phone
  json.url assignee_url(assignee, format: :json)
end
