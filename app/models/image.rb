

class Image
  require "#{Rails.root}/ConnectSDK/lib/ConnectSDK.rb"

  def initialize

    @search_results = HTTParty.get("https://api.gettyimages.com/v3/search/images?phrase=bunny&fields=id,title,thumb,referral_destinations&sort_order=best",
    :headers => {
         "Api-Key" => ENV["GETTY_TOKEN"]}) #RESTART THE TERMINAL IF YOU CHANGE THIS FOR THE LOVE OF GOD

    @flickr_results = HTTParty.get("https://api.flickr.com/services/rest/?method=flickr.photos.search&api_key=4c5a581265e0cd1e851d14574fbdf845&tags=bunny&format=rest",
    :headers => {
         "Api-Key" => ENV["FLICKR_TOKEN"]})


  end

  def results
    @search_results
  end

  def flickr_results
    @flickr_results
  end
  
end
