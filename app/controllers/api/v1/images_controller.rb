class Api::V1::ImagesController < ApplicationController

  def index
    images = Image.new

    render json: {
      images: images.getty_results + images.flickr_results
    }
  end

end
