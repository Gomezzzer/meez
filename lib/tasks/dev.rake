desc "Fill the database tables with some sample data"
task({ :sample_data => :environment }) do
  
  if Rails.env.development?
    # Clear existing data in the correct order to avoid foreign key issues
    MeezEnPlace.destroy_all
    RecipeModifier.destroy_all
    User.destroy_all

    # Create a specific sample user
    george = User.create!(
      avatar_url: Faker::Avatar.image,
      email: "george@example.com",
      password: "password",
      password_confirmation: "password",
      username: Faker::Internet.username,
      created_at: Faker::Time.backward(days: 365 * 5),
      updated_at: Faker::Time.backward(days: 365 * 5) 
    )

    # Create sample recipe modifiers for George
    10.times do
      dish_name = Faker::Food.dish # Generate the dish name once
    
      # Generate multiple measurements and join them into a single string using "/"
      measurements = (1..5).map { "#{rand(50..500)} grams of #{Faker::Food.ingredient}" }.join(" / ")
    
      # Create a custom description based on the dish name
      description = "A delicious #{dish_name.downcase} prepared with love and the finest ingredients."
    
      recipe_modifier = RecipeModifier.create!(
        name: dish_name,
        description: description,
        measurements: measurements,
        allergies: RecipeModifier::ALLERGIES.sample,
        recipe: dish_name, # Use the same dish name
        user: george,
        created_at: Faker::Time.backward(days: 365 * 2),
        updated_at: Faker::Time.backward(days: 365 * 2)
      )
    

      # Create sample meez en place items for each recipe_modifier
      5.times do
        MeezEnPlace.create!(
          ingredient_name: Faker::Food.ingredient,
          measurement: Faker::Food.measurement,
          user_id: george.id,
          created_at: Faker::Time.backward(days: 365 * 2), 
          updated_at: Faker::Time.backward(days: 365 * 2)  
        )
      end
    end

    puts "Sample data has been created successfully."
  else
    puts "This task is intended to run only in the development environment."
  end
end 
