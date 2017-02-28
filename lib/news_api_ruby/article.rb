
module NewsApi
  # An Article object contains read-only attributes for a list of currently
  # available news Articles from a particular source
  class Article < BaseRequest

  	API_KEY_PARAM = "apiKey=#{ENV['API_KEY']}"

    class << self
      # Retrieve a list of current news headlines from a given source 
      # returns [Array] array of Article objects 
      def all source
        endpoint = "articles?source=#{source.id}&#{API_KEY_PARAM}"
        get(endpoint)['articles'].map { |a| new a }
      end
    end
  end
end
