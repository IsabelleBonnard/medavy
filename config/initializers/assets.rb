# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Dir.glob("#{Rails.root}/app/assets/images/**/").each do |path|
#   Rails.application.config.assets.paths << path
# end

Dir.glob("#{Rails.root}/app/assets/images/**/").each do |path|
  Rails.application.config.assets.paths << path
end

# Rails.application.config.assets.paths.each do |p|
#   puts p
# end

# Rails.application.config.assets.paths << Rails.root.join("app", "assets", "Exterior")
# Rails.application.config.assets.paths << Rails.root.join("app", "assets", "images", "Exterior")
# Add additional assets to the asset load path
# Rails.application.config.assets.paths << Emoji.images_path

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in app/assets folder are already added.
# Rails.application.config.assets.precompile += %w( search.js )
