require "test_helper"

class TextfilesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @textfile = textfiles(:one)
  end

  test "should get index" do
    get textfiles_url
    assert_response :success
  end

  test "should get new" do
    get new_textfile_url
    assert_response :success
  end

  test "should create textfile" do
    assert_difference('Textfile.count') do
      post textfiles_url, params: { textfile: { file_url: @textfile.file_url } }
    end

    assert_redirected_to textfile_url(Textfile.last)
  end

  test "should show textfile" do
    get textfile_url(@textfile)
    assert_response :success
  end

  test "should get edit" do
    get edit_textfile_url(@textfile)
    assert_response :success
  end

  test "should update textfile" do
    patch textfile_url(@textfile), params: { textfile: { file_url: @textfile.file_url } }
    assert_redirected_to textfile_url(@textfile)
  end

  test "should destroy textfile" do
    assert_difference('Textfile.count', -1) do
      delete textfile_url(@textfile)
    end

    assert_redirected_to textfiles_url
  end
end
