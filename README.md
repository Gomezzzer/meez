# Meez

Meez is a Ruby on Rails application designed specifically for line chefs. This app allows chefs to add, edit, delete, and scale recipes as needed. Additionally, it features a "Meez en Place" function for storing all the items on their station.

## Features

- **Add Recipes**: Easily add new recipes to your collection.
- **Edit Recipes**: Update existing recipes with new information.
- **Delete Recipes**: Remove recipes that are no longer needed.
- **Scale Recipes**: Adjust ingredient quantities to scale recipes up or down.
- **Take Photographs**:  Use the camera on your mobile device or webcam on your desktop to capture images of recipes or ingredients directly within the app.
- **Upload Images**: Upload images from your device's gallery or file system to add visuals to your recipes.
- **Meez en Place**: Store and organize all the items on your station.

## Installation

To get started with Meez, follow these steps:

1. **Clone the Repository**:
    ```bash
    git clone https://github.com/your-username/meez.git
    ```

2. **Navigate to the Project Directory**:
    ```bash
    cd meez
    ```

3. **Install Dependencies**:
    ```bash
    bundle install
    yarn install
    ```

4. **Set Up the Database**:
    ```bash
    rails db:create
    rails db:migrate
    rails sample_data
    ```

5. **Start the Server**:
    ```bash
    bin/dev
    ```

6. **Visit the App**:
    Open your browser and go to `http://localhost:3000`.

## Usage

### Adding Recipes

1. Navigate to the Recipes section.
2. Click on "Add Recipe".
3. Fill in the recipe details and save.

### Editing Recipes

1. Navigate to the Recipes section.
2. Select the recipe you want to edit.
3. Make the necessary changes and save.

### Deleting Recipes

1. Navigate to the Recipes section.
2. Select the recipe you want to delete.
3. Click on "Delete" and confirm.

### Scaling Recipes

1. Navigate to the Recipes section.
2. Select the recipe you want to scale.
3. Enter the scaling factor and save.

### Photographing and uploading images

1. Click the "Choose file" button to use your device's camera. Capture the image and confirm.
2. Click the "Choose file" button to select a file from your device's gallery or file system. Choose the image and confirm.
3. Save the updated image.

### Meez en Place

1. Navigate to the Meez en Place section.
2. Add items to your station.
3. Organize and manage your items as needed.

## Pain Point

Efficient Recipe Management for Line Chefs:
Line chefs often face the challenge of managing numerous recipes, accurately scaling them for different service volumes, and keeping track of all the ingredients—referred to as "meez" (mise en place). The lack of an organized system can lead to errors in ingredient preparation, inefficient workflow, and inconsistencies in dish quality.

## Solution

Our app solves this by providing a streamlined platform where line chefs can easily access and scale recipes, manage their meez, and ensure every dish is prepared with precision. This not only enhances kitchen efficiency but also maintains the high standards expected in a professional culinary environment.

## User Stories

1. **User will be able to create a recipe**:
   - As a user, I want to be able to create new recipes so that I can add them to my collection and use them for future reference.

2. **User will be able to edit and delete a recipe**:
   - As a user, I want to be able to edit existing recipes to update or correct information, and delete recipes that are no longer needed to keep my collection organized.

3. **User will be able to scale a recipe for larger prep demands**:
   - As a user, I want to be able to scale recipes up to accommodate different serving sizes or prep demands, ensuring accurate ingredient quantities.

4. **User will be able to capture images for recipes**:
   - As a user, I want to be able to capture images with my phone or webcam and upload to recipe card. Optionally I can choose to upload files from my device or desktop.

5. **User will be able to input Meez en Place items to be able to reference before service to ensure they have everything for service**:
   - As a user, I want to be able to input and organize Meez en Place items so that I can quickly reference them before service and ensure I have all necessary items prepared.
## ERD

![uuid=CA9B72B3-2188-49EA-A102-009F05107154 library=1 type=1 mode=1 loc=true cap=true](https://github.com/Gomezzzer/meez/assets/86806874/7b960200-52e8-441f-bb7b-1d9e2a70dfbe)



## Contributing

We welcome contributions to Meez! To contribute, follow these steps:

1. **Fork the Repository**:
    Click the "Fork" button at the top right of the repository page.

2. **Clone Your Fork**:
    ```bash
    git clone https://github.com/your-username/meez.git
    ```

3. **Create a New Branch**:
    ```bash
    git checkout -b feature/your-feature-name
    ```

4. **Make Your Changes**:
    Make changes to the codebase.

5. **Commit Your Changes**:
    ```bash
    git add .
    git commit -m "Add your commit message here"
    ```

6. **Push to Your Branch**:
    ```bash
    git push origin feature/your-feature-name
    ```

7. **Open a Pull Request**:
    Go to the original repository and click "New Pull Request".


## FAQ

### How did you implement recipe scaling in Meez?

To implement recipe scaling, we used the `ruby-units` gem. This gem allows for easy manipulation and conversion of units. Here’s how you can add it to your project:

1. Add `ruby-units` to your Gemfile:
    ```ruby
    gem 'ruby-units'
    ```

2. Run `bundle install` to install the gem.

3. Use `ruby-units` in your recipe model or service to handle unit conversions and scaling calculations. For example:
    ```ruby
    require 'ruby-units'

    def scale_recipe(factor)
      ingredients.each do |ingredient|
        amount = Unit(ingredient.amount) * factor
        ingredient.update(amount: amount.to_s)
      end
    end
    ```

### Can I use Meez on my mobile device?

Yes, Meez is designed to be responsive and can be used on mobile devices. Simply open your mobile browser and navigate to the app’s URL.

### How do I back up my recipes?

You can back up your recipes by exporting them from the app. Navigate to the Recipes section and look for an export option to download your recipes as a file.

### What is "Meez en Place"?

"Meez en Place" is a feature in Meez that allows chefs to store and organize all the items on their station. It helps in maintaining an efficient and organized workspace.

### How do I report a bug or request a feature?

To report a bug or request a feature, please open an issue on the GitHub repository. Provide as much detail as possible to help us understand and address your request.

---

Thank you for using Meez! Happy cooking!
