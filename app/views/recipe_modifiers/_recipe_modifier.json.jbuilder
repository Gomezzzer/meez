json.extract! recipe_modifier, :id, :name, :description, :recipe, :measurements, :created_at, :updated_at
json.url recipe_modifier_url(recipe_modifier, format: :json)
