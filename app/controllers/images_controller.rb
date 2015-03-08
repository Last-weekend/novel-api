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


    #PICTACULOUS RESOURCES FOR LATER
    # http://www.pictaculous.com/api/
    # https://github.com/tatemae-consultancy/pictaculous
    # https://github.com/basgys/rubyctaculous/blob/master/lib/pictaculous/client.rb
    #END RESOURCES

    # EXPERIMENT: can open file as binary to feed to pictaculous?
    # image = "./app/assets/images/duckling.jpg"
    # s = File.open(image, "rb") { |f| f.read }
    # @binary = s
    # @encoding = s.encoding
    #
    # body = {image: s}
    # @response = JSON.parse(HTTParty.post("http://pictaculous.com/api/1.0", :body => body))
    # END EXPERIMENT


    #EXPERIMENT: From Michael, render straight json, no need for a view
    # r = {this: "is a test", results: Image.new.results }
    #
    # render json: @getty_results
    #END EXPERIMENT


    # render json: @flickr_results




    # EXPERIMENT: example code for pictaculous gem
    # pictaculous = Pictaculous::Client.new
    #
    # @colors = pictaculous.color_palette_for_image('./app/assets/images/duckling.jpg')

    # puts colors.inspect
    # => ['FFFFD3', '372C78', '9D7891', '654A86'] # Hex format
    # END EXPERIMENT


  end
end
