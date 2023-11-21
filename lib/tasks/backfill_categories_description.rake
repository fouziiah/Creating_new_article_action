# lib/tasks/backfill_categories_description.rake

namespace :backfill do
    desc 'Backfill categories with descriptions'
  
    task backfill_categories_description: :environment do
      Category.all.each do |category|

        category.update(description: 'Default description') if category.description.blank?
      end
  
      puts 'Categories backfilled successfully.'
    end
  end
  
  # namespace :backfill do
  #   descriptions ={
  #     "general" => "Explore a variety of general topics and stay informed on a wide range of subjects",
  #     "Technology" => "Stay up-to-date with the latest in technology and innovation from around the world",
  #     "Travel"=> "Embark on a journey of discovery with travel-related articles, tips, and destination guides",
  #     "Food" => "Indulge in a culinary adventure with mouthwatering recipes, foodie tips, and dining experiences.",
  #     "Fashion"=> "Dive into the world of fashion, trends, amd style "
  #   }
  # end


  # category.where(description: nil).each do |category|
  #   description = description[category.name]

  #   category.update!(description: description)
  #   puts 'Backfilled desccription for category'#
