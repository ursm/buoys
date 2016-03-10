require 'test_helper'

class BuoysLoaderTest < ActiveSupport::TestCase
  test '.buoy_files' do
    assert_equal Buoys::Loader.buoy_files.size, 2

    assert Buoys::Loader.buoy_files.include?(Rails.root.join('config', 'buoys', 'buoys.rb').to_s)
    assert Buoys::Loader.buoy_files.include?(Rails.root.join('config', 'buoys', 'breadcrumb.rb').to_s)
  end

  test '.buoys' do
    Buoys::Loader.load_buoys_files

    actual_keys = []
    expected_keys = %i(account books show_books about history help)
    expected_keys.each do |key|
      actual_keys << key if Buoys::Loader.buoys.keys.include?(key)
    end

    assert_equal actual_keys, expected_keys
  end
end
