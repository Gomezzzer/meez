# lib/recipe_modifiers.rb

require 'faker'

module CustomFaker
  class RecipeModifier < Faker::Base
    @recipe_names = [
      "Tiramisù",
      "Mushroom Risotto",
      "Pasta Carbonara",
      "Margherita Pizza"
    ]

    @recipe_descriptions = [
      "A classic Italian dessert made with layers of coffee-soaked ladyfingers and mascarpone cream.",
      "A creamy Italian rice dish made with mushrooms, Parmesan cheese, and white wine.",
      "A traditional Roman pasta dish made with eggs, cheese, pancetta, and pepper.",
      "A simple yet delicious pizza topped with fresh tomatoes, mozzarella, and basil."
    ]

    @recipe_ingredients = [
      "Ladyfingers, Mascarpone, Coffee, Cocoa powder, Sugar",
      "Arborio rice, Mushrooms, Parmesan cheese, White wine, Chicken broth",
      "Spaghetti, Eggs, Pecorino Romano cheese, Pancetta, Black pepper",
      "Pizza dough, Tomatoes, Mozzarella cheese, Basil, Olive oil"
    ]

    @recipe_measurements = [
      "200g, 250g, 100ml, 20g, 50g",
      "300g, 200g, 50g, 100ml, 500ml",
      "400g, 3, 100g, 150g, 1 tsp",
      "500g, 4, 200g, 10 leaves, 2 tbsp"
    ]

    @recipe_images = Dir['public/images/recipes/*']

    class << self
      def name
        sample(@recipe_names)
      end

      def description
        sample(@recipe_descriptions)
      end

      def ingredients
        sample(@recipe_ingredients)
      end

      def measurements
        sample(@recipe_measurements)
      end

      def image
        sample(@recipe_images)
      end
    end
  end
end

class RecipeModifier
  attr_accessor :name, :description, :ingredients, :measurements, :image

  def initialize(name, description, ingredients, measurements, image)
    @name = name
    @description = description
    @ingredients = ingredients
    @measurements = measurements
    @image = image
  end

  def to_s
    <<-RECIPE
    Name: #{@name}
    Description: #{@description}
    Ingredients: #{@ingredients}
    Measurements: #{@measurements}
    Image: #{@image}
    RECIPE
  end
end

