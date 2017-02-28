

module NewsApi
  # A BaseRequest is used to make simple requests to the newsapi.org service.
  # This class only cares about making the request, and whether it was
  # successful or not. For more complex parsing of responses, extend this class
  class BaseRequest
    class << self
      BASE_REQUEST_URL = 'https://newsapi.org/v1'.freeze
      SUCCESS = 200

      def get endpoint
        response = Faraday.get "#{BASE_REQUEST_URL}/#{endpoint}"
        raise failed_request(response) unless success?(response)
        parse response.body
      end

      private

      def parse response
        JSON.parse response
      end

      def success? response
        response.status == SUCCESS
      end

      def failed_request response
        msg = "#{response.status}: #{response.reason_phrase}"
        NewsApi::Exceptions::FailedRequest.new msg
      end
    end
  end
end
