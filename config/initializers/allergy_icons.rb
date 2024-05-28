# config/initializers/allergy_icons.rb

allergy_icons = %w(peanut.png dairy.png gluten.png lobster.png vegan.png vegetarian.png)

Rails.application.config.assets.precompile += allergy_icons
