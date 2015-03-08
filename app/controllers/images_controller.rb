class ImagesController < ApplicationController
  def show
    @getty_results = Image.new.getty_results

    @flickr_results = Image.new.flickr_results


    bunny_images = []

    @flickr_results["rsp"]["photos"]["photo"].each do |photo|
       farm_id = photo["farm"]
       secret = photo["secret"]
       id = photo["id"]
       server_id = photo["server"]
       size_token = "m"
       bunny_images << "https://farm#{farm_id}.staticflickr.com/#{server_id}/#{id}_#{secret}_#{size_token}.jpg"
    end


    @getty_results["images"].each do |photo|
      bunny_images << photo["referral_destinations"][0]["uri"]
    end

    render json: {bunny_images: bunny_images}
  end
end
