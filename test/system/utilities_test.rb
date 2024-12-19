require "application_system_test_case"

class UtilitiesTest < ApplicationSystemTestCase
  setup do
    @utility = utilities(:one)
  end

  test "visiting the index" do
    visit utilities_url
    assert_selector "h1", text: "Utilities"
  end

  test "should create utility" do
    visit utilities_url
    click_on "New utility"

    fill_in "Description", with: @utility.description
    fill_in "Kiosk", with: @utility.kiosk_id
    fill_in "Name", with: @utility.name
    click_on "Create Utility"

    assert_text "Utility was successfully created"
    click_on "Back"
  end

  test "should update Utility" do
    visit utility_url(@utility)
    click_on "Edit this utility", match: :first

    fill_in "Description", with: @utility.description
    fill_in "Kiosk", with: @utility.kiosk_id
    fill_in "Name", with: @utility.name
    click_on "Update Utility"

    assert_text "Utility was successfully updated"
    click_on "Back"
  end

  test "should destroy Utility" do
    visit utility_url(@utility)
    click_on "Destroy this utility", match: :first

    assert_text "Utility was successfully destroyed"
  end
end
