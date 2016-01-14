json.array!(@todos) do |todo|
  json.extract! todo, :title
  json.url todo_url(todo, format: :json)
end
