require 'rack/test'
require 'rspec'

ENV['RACK_ENV'] = 'test'

require File.expand_path '../../app.rb', __FILE__
require File.expand_path '../../rack_config.rb', __FILE__

module RSpecMixin
  include Rack::Test::Methods
  def app() URWelcome end
end

RSpec.configure { |c| c.include RSpecMixin }
