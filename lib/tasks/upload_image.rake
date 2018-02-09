namespace :upload_image do
  desc "upload image"
  task upload_image: :environment do

    auth = {
      cloud_name: "dhzyzerqn",
      api_key:    "727928369654327",
      api_secret: "I845JWAmXjvOzGD0Pdaa5JMO6ZI"
    }

    response = Cloudinary::Uploader.upload("app/assets/images/dragon-onsie.png", auth)
    # binding.pry
  end
end
