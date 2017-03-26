require 'news_api_ruby'

# Tests for the Source class
describe NewsApi::Source do
  before(:context) do
    @test_source_data = {
      category: 'Test Category',
      country: 'us',
      description: 'Test Description',
      id: 'test-id',
      language: 'en',
      name: 'Test Name',
      sortBysAvailable: ['top'],
      url: 'https://www.test_url.com',
      urlsToLogos: { small: 'https://www.test_url_to_image.com' }
    }
  end

  context '#source_request' do
    it 'should be possible to initialize a Source' do
      s = NewsApi::Source.new(@test_source_data)
      expect(s).to be_truthy
    end

    before(:context) do
      @source = NewsApi::Source.new(@test_source_data)
    end

    describe 'testing referencing variables of a Source object' do
      it 'should have the correct category' do
        expect(@source.category).to eq('Test Category')
      end

      it 'should have the correct country' do
        expect(@source.country).to eq('us')
      end

      it 'should have the correct description' do
        expect(@source.description).to eq('Test Description')
      end

      it 'should have the correct id' do
        expect(@source.id).to eq('test-id')
      end

      it 'should have the correct language' do
        expect(@source.language).to eq('en')
      end

      it 'should have the correct name' do
        expect(@source.name).to eq('Test Name')
      end

      it 'should have the correct sortBysAvailable' do
        expect(@source.sortBysAvailable).to eq(['top'])
      end

      it 'should have the correct url' do
        expect(@source.url).to eq('https://www.test_url.com')
      end

      it 'should have the correct urlsToLogos' do
        urls_to_logos = { small: 'https://www.test_url_to_image.com' }
        expect(@source.urlsToLogos).to eq(urls_to_logos)
      end
    end

    context 'Testing live API calls', missing_api_key: ENV['API_KEY'].nil? do
      it 'should be possible to request all sources' do
        s = NewsApi::Source.all
        expect(s).to be_truthy
      end
    end
  end
end
