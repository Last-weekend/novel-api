

class Image
  require "#{Rails.root}/ConnectSDK/lib/ConnectSDK.rb"

  def initialize

    @getty_results = HTTParty.get("https://api.gettyimages.com/v3/search/images?phrase=bunny&fields=id,title,thumb,referral_destinations&sort_order=best",
    :headers => {
         "Api-Key" => ENV["GETTY_TOKEN"]}) #RESTART THE TERMINAL IF YOU CHANGE THIS FOR THE LOVE OF GOD

    @flickr_results = HTTParty.get("https://api.flickr.com/services/rest/?method=flickr.photos.search&api_key=4c5a581265e0cd1e851d14574fbdf845&tags=bunny&format=rest",
    :headers => {
         "Api-Key" => ENV["FLICKR_TOKEN"]})


  end

  def getty_results

    bunny_images = []

    @getty_results["images"].each do |photo|
      bunny_images << photo["referral_destinations"][0]["uri"]
    end

    bunny_images
  end

  def flickr_results
    bunny_images = []
    
    @flickr_results["rsp"]["photos"]["photo"].each do |photo|
       farm_id = photo["farm"]
       secret = photo["secret"]
       id = photo["id"]
       server_id = photo["server"]
       size_token = "m"
       bunny_images << "https://farm#{farm_id}.staticflickr.com/#{server_id}/#{id}_#{secret}_#{size_token}.jpg"
    end

    bunny_images

  end

end
