json.array!(@pets) do |pet|
  json.extract! pet, :id, :name, :picture, :max_weight, :eat_score
  json.url pet_url(pet, format: :json)
end
