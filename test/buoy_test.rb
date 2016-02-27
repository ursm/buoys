require 'test_helper'

class BuoyTest < ActiveSupport::TestCase
  test ".buoy_file_paths" do
    assert_equal [Rails.root.join('config', 'buoys', '**', '*.rb')], Buoy.buoy_file_paths
  end
end
