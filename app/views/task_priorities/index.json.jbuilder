json.array!(@task_priorities) do |task_priority|
  json.extract! task_priority, :name
  json.url task_priority_url(task_priority, format: :json)
end