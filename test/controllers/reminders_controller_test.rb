require 'test_helper'

class RemindersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @reminder = reminders(:one)
  end

  test "should get index" do
    get reminders_url
    assert_response :success
  end

  test "should get new" do
    get new_reminder_url
    assert_response :success
  end

  test "should create reminder" do
    assert_difference('Reminder.count') do
      post reminders_url, params: { reminder: { date: @reminder.date, mileage: @reminder.mileage, name: @reminder.name, vehicle_id: @reminder.vehicle_id } }
    end

    assert_redirected_to reminder_url(Reminder.last)
  end

  test "should show reminder" do
    get reminder_url(@reminder)
    assert_response :success
  end

  test "should get edit" do
    get edit_reminder_url(@reminder)
    assert_response :success
  end

  test "should update reminder" do
    patch reminder_url(@reminder), params: { reminder: { date: @reminder.date, mileage: @reminder.mileage, name: @reminder.name, vehicle_id: @reminder.vehicle_id } }
    assert_redirected_to reminder_url(@reminder)
  end

  test "should destroy reminder" do
    assert_difference('Reminder.count', -1) do
      delete reminder_url(@reminder)
    end

    assert_redirected_to reminders_url
  end
end
