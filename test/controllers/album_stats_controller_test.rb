require 'test_helper'

class AlbumStatsControllerTest < ActionController::TestCase
  setup do
    @album_stat = album_stats(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:album_stats)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create album_stat" do
    assert_difference('AlbumStat.count') do
      post :create, album_stat: {  }
    end

    assert_redirected_to album_stat_path(assigns(:album_stat))
  end

  test "should show album_stat" do
    get :show, id: @album_stat
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @album_stat
    assert_response :success
  end

  test "should update album_stat" do
    patch :update, id: @album_stat, album_stat: {  }
    assert_redirected_to album_stat_path(assigns(:album_stat))
  end

  test "should destroy album_stat" do
    assert_difference('AlbumStat.count', -1) do
      delete :destroy, id: @album_stat
    end

    assert_redirected_to album_stats_path
  end
end
