#add into PATH blunder lib
$LOAD_PATH.unshift(File.expand_path(File.dirname(__FILE__)))
$LOAD_PATH.unshift(File.expand_path(File.join(File.dirname(__FILE__), '..', 'lib')))
require 'blunder'

require 'rspec'
require 'rspec/autorun'

RSpec.configure do |config|

end

