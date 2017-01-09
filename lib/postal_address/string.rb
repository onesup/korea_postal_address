module PostalAddress
  # https://github.com/rubyworks/facets/blob/27d9b7f5b3a507da17c0f48c1a7a95079359470d/lib/core/facets/string/snakecase.rb
  def snakecase
    gsub(/([A-Z]+)([A-Z][a-z])/,'\1_\2').
    gsub(/([a-z\d])([A-Z])/,'\1_\2').
    tr('-', '_').
    gsub(/\s/, '_').
    gsub(/__+/, '_').
    downcase
  end
end

class String
  include PostalAddress
end
