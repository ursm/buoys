require 'test_helper'

class BuoysTest < ActiveSupport::TestCase
  test '.buoy_file_paths' do
    assert_equal [Rails.root.join('config', 'buoys', '**', '*.rb')], Buoys.buoy_file_paths
  end
end
