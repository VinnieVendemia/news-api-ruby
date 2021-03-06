
module NewsApi
  # An Article object contains read-only attributes for a list of currently
  # available news Articles from a particular source
  class Article < BaseRequest
    API_KEY_PARAM = "apiKey=#{ENV['API_KEY']}".freeze

    class << self
      # Retrieve a list of current news headlines from a given source
      # returns [Array] array of Article objects
      def all source
        source = source_id(source)
        endpoint = "articles?source=#{source}&#{API_KEY_PARAM}"
        get(endpoint)['articles'].map { |a| new a }
      end

      private

      # determines if parameter is already a source id string or
      # if a source object was passed, return a valid source id
      def source_id source
        source.is_a?(NewsApi::Source) ? source.id : source
      end
    end
  end
end
