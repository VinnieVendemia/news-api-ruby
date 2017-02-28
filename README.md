# NEWS API Wrapper

Ruby Wrapper for grabbing data from [newsapi](https://newsapi.org/).  Grab sources and articles quickly and easily. 

## Install 

Add 

```
	gem 'news_api_ruby'
```

to your Gemfile, or, 

```
	gem install news_api_ruby
```

## Usage

There are only 2 endpoints for the newsapi.  'sources' and 'article'.  The gem has broken these endpoints into 2 classes to make it easier to request for both. 

### Source 

Get all available sources using 

```ruby
sources = NewsApi::Source.all
```

This will return a list of all available sources, wrapped up in a nice Source object.  The source object has access to a number of different fields, for example: 

```ruby
source = sources.first
source.category # => general
source.country # => us
source.description # => The AP delivers in-depth coverage on the international, politics, lifestyle, business, and entertainment news.
source.id # => 'associated-press'
```
### Article
> TODO

## Tests

> TODO

## Contributing 

Please submit bug/feature requests on the [github issue page](https://github.com/VinnieVendemia/news_api_ruby/issues). Of course, pull requests are welcome as well! 

This codebase meets rubocop standards (with some exceptions).  If contributing, please ensure your PR meets these.

## License

MIT 
