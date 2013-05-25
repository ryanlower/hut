module Hut
  class Config
    require 'yaml'

    def initialize
      if File.exists? config_path
        @config = YAML.load_file config_path
      else
        raise 'config must be provided at ~/.hut'
      end
    end

    def config_path
      if ENV['HOME'] && File.directory?(ENV['HOME'])
        File.expand_path '~/.hut'
      end
    end

    def account
      @config[:account]
    end

    def token
      @config[:token]
    end
  end
end
