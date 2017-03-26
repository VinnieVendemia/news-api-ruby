require 'news_api_ruby'

# Tests for the BaseRequest class
describe NewsApi::BaseRequest do
  before(:context) do
    @test_request_data = {
      test_var: 'Test Var'
    }
  end

  context '#initialize' do
    it 'should be possible to initialize a BaseRequest' do
      br = NewsApi::BaseRequest.new(@test_request_data)
      expect(br).to be_truthy
    end
  end

  context '#private_methods' do

    let(:positive_response) do
      Faraday::Response.new(status: 200,
                            body: "{\"test\":\"String\"}",
                            reason_phrase: "Success"
                            )
    end

    let(:failure_response) do
      Faraday::Response.new(status: 400,
                            body: "{\"bad\":\"Request\"}",
                            reason_phrase: "Bad Request"
                            )
    end

    it 'should properly parse' do
      body = NewsApi::BaseRequest.send(:parse, positive_response)
      expect(body['test']).to eq('String')
    end

    it 'should be that a successful status is true' do
      response = NewsApi::BaseRequest.send(:success?, positive_response)
      expect(response).to be true
    end

    it 'should be that a failure status is false' do
      response = NewsApi::BaseRequest.send(:success?, failure_response)
      expect(response).to be false
    end

    it 'should generate a failed request' do 
      error = NewsApi::BaseRequest.send(:failed_request, failure_response)
      expect(error.message).to eq("400: Bad Request")
    end
  end
end
