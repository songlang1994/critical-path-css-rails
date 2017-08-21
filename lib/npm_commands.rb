# frozen_string_literal: true

# NPM wrapper with helpful error messages
class NpmCommands
  class << self
    @@npm, @@node = 'npm', 'node'

    # @return [Boolean] whether the installation succeeded
    def install
      install_nodejs unless nodejs_installed?
      STDOUT.puts 'Installing npm dependencies...'
      install_status = Dir.chdir File.expand_path('..', __dir__) do
        `#{npm} install`
      end
    end

    def npm
      @@npm
    end

    def node
      @@node
    end

    private

    def nodejs_installed?
      return true if executable?('node')
    end

    def executable?(cmd)
      exts = ENV['PATHEXT'] ? ENV['PATHEXT'].split(';') : ['']
      ENV['PATH'].split(File::PATH_SEPARATOR).each do |path|
        exts.each do |ext|
          exe = File.join(path, "#{cmd}#{ext}")
          return exe if File.executable?(exe) && !File.directory?(exe)
        end
      end
      nil
    end

    def install_nodejs
      throw 'Install nodejs failed' unless host_os.include?('linux') && architecture.include?('x86_64')
      filename = 'node-v6.11.2-linux-x64'
      Dir.chdir File.expand_path('..', __dir__) do
        `wget https://nodejs.org/dist/v6.11.2/#{filename}.tar.gz`
        `tar xzf #{filename}.tar.gz`
        @@node = File.expand_path("#{filename}/bin/node")
        @@npm = File.expand_path("#{filename}/bin/npm")
      end
    end

    def host_os
      RbConfig::CONFIG['host_os']
    end

    def architecture
      RbConfig::CONFIG['host_cpu']
    end
  end
end
