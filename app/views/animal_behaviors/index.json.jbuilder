json.array!(@animal_behaviors) do |animal_behavior|
  json.extract! animal_behavior, :id, :code, :behavior
  json.url animal_behavior_url(animal_behavior, format: :json)
end
