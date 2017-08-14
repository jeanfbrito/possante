require 'test_helper'

class RefuellingsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @refuelling = refuellings(:one)
  end

  test "should get index" do
    get refuellings_url
    assert_response :success
  end

  test "should get new" do
    get new_refuelling_url
    assert_response :success
  end

  test "should create refuelling" do
    assert_difference('Refuelling.count') do
      post refuellings_url, params: { refuelling: { date: @refuelling.date, gas_station: @refuelling.gas_station, liter_price: @refuelling.liter_price, liters: @refuelling.liters, mileage: @refuelling.mileage, result: @refuelling.result, total_value: @refuelling.total_value, traveled_mileage: @refuelling.traveled_mileage } }
    end

    assert_redirected_to refuelling_url(Refuelling.last)
  end

  test "should show refuelling" do
    get refuelling_url(@refuelling)
    assert_response :success
  end

  test "should get edit" do
    get edit_refuelling_url(@refuelling)
    assert_response :success
  end

  test "should update refuelling" do
    patch refuelling_url(@refuelling), params: { refuelling: { date: @refuelling.date, gas_station: @refuelling.gas_station, liter_price: @refuelling.liter_price, liters: @refuelling.liters, mileage: @refuelling.mileage, result: @refuelling.result, total_value: @refuelling.total_value, traveled_mileage: @refuelling.traveled_mileage } }
    assert_redirected_to refuelling_url(@refuelling)
  end

  test "should destroy refuelling" do
    assert_difference('Refuelling.count', -1) do
      delete refuelling_url(@refuelling)
    end

    assert_redirected_to refuellings_url
  end
end
