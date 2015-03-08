class ImagesController < ApplicationController
  def show
    @results = Image.new.results

    @flickr_results = Image.new.flickr_results

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
    # render json: r
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
