require 'news_api_ruby'

# Tests for Exceptions
describe NewsApi::Exceptions do
  context '#initialize' do
    let(:msg) do
      '400: Bad Request'
    end

    it 'should be possible to initialize a FailedRequest' do
      err = NewsApi::Exceptions::FailedRequest.new msg
      expect(err).to be_truthy
    end
  end
end
