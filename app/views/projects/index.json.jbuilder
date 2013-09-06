json.array!(@projects) do |project|
  json.extract! project, :name, :date_ini, :date_end, :description, :cost_hr
  json.url project_url(project, format: :json)
end