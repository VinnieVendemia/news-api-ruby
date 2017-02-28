

module NewsApi
  class Source < BaseRequest

    def initialize source
      source.each do |k,v|
        instance_variable_set("@#{k}", v)
        singleton_class.class_eval { attr_reader k }
      end
    end

    class << self
      def all
        get('sources')['sources'].map {|s| new s }
      end
    end

  end
end
