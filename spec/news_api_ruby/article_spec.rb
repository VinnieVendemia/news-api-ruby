require 'news_api_ruby'

# Tests for the Article class
describe NewsApi::Article do

  before(:context) do
    @test_article_data = {
      author: 'Test Author',
      description: 'Test Description',
      publishedAt: '2017-03-26T15:54:17',
      title: 'Test Title',
      url: 'https://www.test_url.com',
      urlToImage: 'https://www.test_url_to_image.com'
    }
  end

  context '#article_request' do

    it 'should be possible to initialize an Article' do
      a = NewsApi::Article.new(@test_article_data)
      expect(a).to be_truthy
    end

    before(:context) do
      @article = NewsApi::Article.new(@test_article_data)
    end

    describe 'testing referencing variables of an Article object' do
      it 'should have the correct author' do
        expect(@article.author).to eq('Test Author')
      end

      it 'should have the correct description' do
        expect(@article.description).to eq('Test Description')
      end

      it 'should have the correct publishedAt date' do
        expect(@article.publishedAt).to eq('2017-03-26T15:54:17')
      end

      it 'should have the correct title' do
        expect(@article.title).to eq('Test Title')
      end

      it 'should have the correct url' do
        expect(@article.url).to eq('https://www.test_url.com')
      end

      it 'should have the correct urlToImage' do
        expect(@article.urlToImage).to eq('https://www.test_url_to_image.com')
      end
    end

    context 'Testing live API calls', missing_api_key: ENV['API_KEY'].nil? do

      let(:source) do
        s = NewsApi::Source.new(id: 'abc-news-au')
      end

      it 'should be possible to request an article by id' do
        a = NewsApi::Article.all 'abc-news-au'
        expect(a).to be_truthy
      end

      it 'should be possible to request an article by Source object' do
        a = NewsApi::Article.all source
        expect(a).to be_truthy
      end
    end
  end
end
