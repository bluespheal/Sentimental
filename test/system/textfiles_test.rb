require "application_system_test_case"

class TextfilesTest < ApplicationSystemTestCase
  setup do
    @textfile = textfiles(:one)
  end

  test "visiting the index" do
    visit textfiles_url
    assert_selector "h1", text: "Textfiles"
  end

  test "creating a Textfile" do
    visit textfiles_url
    click_on "New Textfile"

    fill_in "File url", with: @textfile.file_url
    click_on "Create Textfile"

    assert_text "Textfile was successfully created"
    click_on "Back"
  end

  test "updating a Textfile" do
    visit textfiles_url
    click_on "Edit", match: :first

    fill_in "File url", with: @textfile.file_url
    click_on "Update Textfile"

    assert_text "Textfile was successfully updated"
    click_on "Back"
  end

  test "destroying a Textfile" do
    visit textfiles_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Textfile was successfully destroyed"
  end
end
