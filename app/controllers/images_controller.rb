class ImagesController < ApplicationController
  def show
    @results = Image.new.results

    # EXPERIMENT: can open file as binary to feed to pictaculous?
    image = "./app/assets/images/duckling.jpg"
    # s = File.open("./app/assets/images/dont_starve.jpg", 'r') { |io| io.read }
    s = File.open(image, "rb") { |f| f.read }
    @binary = s
    @encoding = s.encoding

    body = {image: s}
    @response = JSON.parse(HTTParty.post("http://pictaculous.com/api/1.0", :body => body))
    # END EXPERIMENT




    # EXPERIMENT: example code for pictaculous gem
    # pictaculous = Pictaculous::Client.new
    #
    # @colors = pictaculous.color_palette_for_image('./app/assets/images/duckling.jpg')

    # puts colors.inspect
    # => ['FFFFD3', '372C78', '9D7891', '654A86'] # Hex format
    # END EXPERIMENT


  end
end
