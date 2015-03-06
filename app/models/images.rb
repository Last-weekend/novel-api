class Image
  def initialize
    @full_json = HTTParty.get("GET https://api.gettyimages.com/v3/search/images?phrase=bunny&fields=id,title,thumb,referral_destinations&sort_order=best",
    :headers => {
         "Api-Key" => "#{ENV['GETTY_TOKEN']}"})
  end

  def repos
    @full_json
  end
end
