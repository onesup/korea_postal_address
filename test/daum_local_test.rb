require 'minitest/autorun'
require 'postal_address'

class TestDaumLocal < Minitest::Test
  def setup
    @daum_local = PostalAddress::DaumLocal.new(ENV["DAUM_API_KEY"])
  end

  def test_address_to_address2
    assert_equal('능동로1길 15|능동로1길 19',
                @daum_local.address_to_coordinates('서울 광진구 자양동 87-1')[0][:new_address],
                '정제되지 않은 주소 넣어서 정제된 주소 기초자료 얻기')
  end

  def test_find_address_by_keyword
    assert_equal('서울 광진구 능동로1길 15',
                @daum_local.find_address_by_keyword('자양동 한강우성아파트')[0][:new_address],
                '정제되지 않은 주소 넣어서 정제된 주소 기초자료 얻기')
  end
end
