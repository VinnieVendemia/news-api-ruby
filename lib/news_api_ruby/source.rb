

module NewsApi
  # A Source object contains read-only attributes for currently available
  # news sources on https://newsapi.org/
  class Source < BaseRequest
    class << self
      def all
        get('sources')['sources'].map { |s| new s }
      end
    end
  end
end
