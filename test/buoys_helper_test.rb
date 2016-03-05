require 'test_helper'

class BuoysHelerTest < ActionView::TestCase
  include Buoys::Helper

  test '.buoy (only current)' do
    assert respond_to?(:breadcrumb)

    buoy :account
    html = render('breadcrumbs/buoys').gsub(/[[:space:]]{2,}|\n/, '')

    assert_dom_equal %{<ul><li><a class="current" href=""><span>Account</span></a></li></ul>}, html
  end

  test '.buoy (not only current)' do
    buoy :history
    html = render('breadcrumbs/buoys').gsub(/[[:space:]]{2,}|\n/, '')

    assert_dom_equal %{<ul><li><a class="hover" href="/about"><span>about</span></a><span>&gt;</span></li><li><a class="current" href=""><span>history</span></a></li></ul>}, html
  end

  test '.buoy (have 2 `link`s in one buoy block)' do
    breadcrumb :help, true
    html = render('breadcrumbs/buoys').gsub(/[[:space:]]{2,}|\n/, '')

    assert_dom_equal %{<ul><li><a class="hover" href="https://example.com/help"><span>help</span></a><span>&gt;</span></li><li><a class="current" href=""><span>usage</span></a></li></ul>}, html
  end
end
