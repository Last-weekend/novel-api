

class Image
  require "#{Rails.root}/ConnectSDK/lib/ConnectSDK.rb"

  def initialize

    @search_results = HTTParty.get("https://api.gettyimages.com/v3/search/images?phrase=bunny&fields=id,title,thumb,referral_destinations&sort_order=best",
    :headers => {
         "Api-Key" => ENV["GETTY_TOKEN"]}) #RESTART THE TERMINAL IF YOU CHANGE THIS FOR THE LOVE OF GOD

  end

  def results
    @search_results
  end
end
