module PostalAddress
  class DaumLocal
    attr_reader :apikey

    ADDR2COORD_URL = 'https://apis.daum.net//local/geo/addr2coord'.freeze
    KEYWORD_URL = 'https://apis.daum.net/local/v1/search/keyword.json'.freeze

    def initialize(apikey)
      @apikey = apikey
    end

    def address_to_coordinates(address)
      params = { q: address, output: 'json' }
      response = query(ADDR2COORD_URL, params).body
      extract_result(response, :address) # Second argument should be a symbol
    end

    def find_address_by_keyword(keyword)
      params = { query: keyword }
      response = query(KEYWORD_URL, params).body
      extract_result(response, :keyword)
    end

    private

    def request_to_daum(url, params)
      RestClient.get(url, params: { apikey: apikey }.merge(params))
    end

    def query(url, params)
      request_to_daum(url, params)
    rescue RestClient::ExceptionWithResponse => err
      err.response
    end

    def render_json(body)
      JSON.parse(body, symbolize_names: true)
    end

    def extract_result(content, result_type)
      result_json  = render_json(content)
      if result_json[:errorType].nil?
        items = result_json[:channel][:item]
        columns = send("columns_#{result_type}_to_address".to_sym)
        result = []
        items.each do |item|
          hash = {}
          columns.each do |column|
            hash = hash.merge(column.snakecase.to_sym => item[column.to_sym])
          end
          result << hash
        end
        result
      else
        result_json
      end
    end

    def columns_address_to_address
      columns = %w(isNewAddress title newAddress zone_no)
      columns += %w(localName_1 localName_2 localName_3 mainAddress subAddress buildingAddress)
    end

    def columns_keyword_to_address
      columns = %w(title newAddress address)
    end
  end
end
