require 'test_helper'

class BuoysLoaderTest < ActiveSupport::TestCase
  test '.buoy_files' do
    assert_equal Buoys::Loader.buoy_files.size, 2

    assert Buoys::Loader.buoy_files.include?(Rails.root.join('config', 'buoys', 'buoys.rb').to_s)
    assert Buoys::Loader.buoy_files.include?(Rails.root.join('config', 'buoys', 'breadcrumb.rb').to_s)
  end

  test '.buoys' do
    Buoys::Loader.load_buoys_files
    assert_equal Buoys::Loader.buoys.keys, %i(account about)
  end
end
