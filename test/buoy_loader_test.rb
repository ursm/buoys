require 'test_helper'

class BuoyLoaderTest < ActiveSupport::TestCase
  test '.buoy_files' do
    assert_equal Buoy::Loader.buoy_files.size, 2

    assert Buoy::Loader.buoy_files.include?(Rails.root.join('config', 'buoys', 'buoys.rb').to_s)
    assert Buoy::Loader.buoy_files.include?(Rails.root.join('config', 'buoys', 'breadcrumb.rb').to_s)
  end

  test '.buoys' do
    Buoy::Loader.load_buoys_files
    assert_equal Buoy::Loader.buoys.keys, %i(account about)
  end
end
