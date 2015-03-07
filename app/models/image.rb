

class Image
  require "#{Rails.root}/ConnectSDK/lib/ConnectSDK.rb"

  def initialize
    @search_results = HTTParty.get("https://api.gettyimages.com/v3/search/images?phrase=bunny&fields=id,title,thumb,referral_destinations&sort_order=best",
    :headers => {
         "Authorization" => "Api-Key:#{ENV['GETTY_TOKEN']}"})

    #  @search_results = HTTParty.get("https://api.gettyimages.com/v3/search/images?phrase=bunny&fields=id,title,thumb,referral_destinations&sort_order=best",
    #  :basic_auth => {
    #       "Api-Key" => "#{ENV['GETTY_TOKEN']}"})

    # curl -i -H "Api-Key:j878g39yx378pa77djthzzpn" "https://api.gettyimages.com/v3/search/images?phrase=books"

    # api_key = ENV['GETTY_TOKEN']
    # api_secret = ENV['GETTY_SECRET']
    #
    # # create instance of the Connect SDK
    # connectSdk = ConnectSdk.new(api_key, api_secret)
    # @search_results = connectSdk
    #     .search().images()
    #     .with_phrase("gorilla")
    #     .with_page(2)
    #     .with_page_size(5)
    #     .execute()
  end

  def results
    @search_results
  end
end
