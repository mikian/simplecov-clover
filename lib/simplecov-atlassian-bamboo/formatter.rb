module SimpleCov::Formatter
  class AtlassianBambooFormatter
    def format(result)
      require 'pry';binding.pry
    end
  end
end
