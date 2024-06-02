desc "Fill the database tables with some sample data"
task({ :sample_data => :environment }) do
  

  # lib/tasks/dev.rake
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
      created_at: Faker::Time.backward(days: 365 * 5), # Random date within the last 5 years
      updated_at: Faker::Time.backward(days: 365 * 5)  # Random date within the last 5 years
    )

    # Create sample recipe modifiers for George
    10.times do
      recipe_modifier = RecipeModifier.create!(
        name: Faker::Food.dish,
        description: Faker::Food.description,
        measurements: Faker::Food.measurement,
        allergies: RecipeModifier::ALLERGIES.sample,
        recipe: Faker::Food.dish,
        user: george,
        created_at: Faker::Time.backward(days: 365 * 2), # Random date within the last 2 years
        updated_at: Faker::Time.backward(days: 365 * 2)  # Random date within the last 2 years
      )

      # Create sample meez en place items for each recipe_modifier
      5.times do
        MeezEnPlace.create!(
          ingredient_name: Faker::Food.ingredient,
          measurement: Faker::Food.measurement,
          user_id: george.id,
          created_at: Faker::Time.backward(days: 365 * 2), # Random date within the last 2 years
          updated_at: Faker::Time.backward(days: 365 * 2)  # Random date within the last 2 years
        )
      end
    end

    puts "Sample data has been created successfully."
  else
    puts "This task is intended to run only in the development environment."
  end
end 
