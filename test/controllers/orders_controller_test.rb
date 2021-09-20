require "test_helper"

class OrdersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @order = orders(:one)
  end

  test "should get index" do
    get orders_url
    assert_response :success
  end

  test "should get new" do
    get new_order_url
    assert_response :success
  end

  test "should show order" do
    get order_url(@order)
    assert_response :success
  end

  test "should get edit" do
    get edit_order_url(@order)
    assert_response :success
  end

  test "should update order" do
    patch order_url(@order), params: { order: { category_id: @order.category_id, currency: @order.currency, discount_amount: @order.discount_amount, gross_amount: @order.gross_amount } }
    assert_redirected_to order_url(@order)
  end

  test "should destroy order" do
    assert_difference('Order.count', -1) do
      delete order_url(@order)
    end

    assert_redirected_to orders_url
  end

  test "should gives an error if gross and discount is equal" do
    category = add_category
    order = Order.new(category_id: category.id, currency: 'TL', discount_amount: 50, gross_amount: 50)
    assert !order.valid?
  end

  test "should gives an error if discount is greater than gross" do
    category = add_category
    order = Order.new(category_id: category.id, currency: 'TL', discount_amount: 100, gross_amount: 50)
    assert !order.valid?
  end

  test "should gives an error if currency is not TL USD EUR" do
    category = add_category
    exception = assert_raises(Exception) { Order.new(category_id: category.id, currency: 'TRY', discount_amount: 5, gross_amount: 100) }
    assert exception.kind_of?(ArgumentError)
  end

  def add_category
    category = Category.new(name: 'testName')
    category.save
    category
  end
end
