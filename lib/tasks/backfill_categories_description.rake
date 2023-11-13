# lib/tasks/backfill_categories_description.rake

namespace :backfill do
    desc 'Backfill categories with descriptions'
  
    task categories_description: :environment do
      Category.all.each do |category|

        category.update(description: 'Default description') if category.description.blank?
      end
  
      puts 'Categories backfilled successfully.'
    end
  end
  