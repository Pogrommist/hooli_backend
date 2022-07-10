Cloudinary.config do |config|
    config.cloud_name = ENV['CLOUDINARY_CLOUDNAME']
    config.api_key = ENV['CLOUDINARY_API_KEY']
    config.api_secret = ENV['CLOUDINARY_SECRET_KEY']
    config.secure = true
  end