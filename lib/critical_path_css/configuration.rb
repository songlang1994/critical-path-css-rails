require 'erb'
module CriticalPathCss
  class Configuration

    def initialize(config)
      @config = config
    end

    def base_url
      @config['base_url']
    end

    def css_path
      @config['css_path']
    end

    def manifest_name
      @config['manifest_name']
    end

    def routes
      @config['routes']
    end

    def action_routes
      @config['action_routes']
    end

    def retry_times
      @config['retry_times']
    end

    def penthouse_options
      @config['penthouse_options'] || {}
    end
  end
end
