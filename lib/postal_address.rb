require 'rest-client'
require 'json'
require 'singleton'

module PostalAddress
  class Error < StandardError; end
  autoload :DaumLocal, 'postal_address/daum_local'
end

require 'postal_address/string'
