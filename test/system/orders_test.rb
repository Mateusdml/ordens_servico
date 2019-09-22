require "application_system_test_case"

class OrdersTest < ApplicationSystemTestCase
  setup do
    @order = orders(:one)
  end

  test "visiting the index" do
    visit orders_url
    assert_selector "h1", text: "Ordens de Serviço"
  end

  test "creating a Order" do
    visit orders_url
    click_on "Nova Ordem"

    fill_in "Data", with: @order.data
    fill_in "Detalhe", with: @order.detalhe
    fill_in "Employee", with: @order.employee
    fill_in "Horafim", with: @order.horaFim
    fill_in "Horainicio", with: @order.horaInicio
    fill_in "Quantidade", with: @order.quantidade
    fill_in "Service", with: @order.service_id
    click_on "Create Order"

    assert_text "Order was successfully created"
    click_on "Back"
  end

  test "updating a Order" do
    visit orders_url
    click_on "Edit", match: :first

    fill_in "Data", with: @order.data
    fill_in "Detalhe", with: @order.detalhe
    fill_in "Employee", with: @order.employee
    fill_in "Horafim", with: @order.horaFim
    fill_in "Horainicio", with: @order.horaInicio
    fill_in "Quantidade", with: @order.quantidade
    fill_in "Service", with: @order.service_id
    click_on "Update Order"

    assert_text "Order was successfully updated"
    click_on "Back"
  end

  test "destroying a Order" do
    visit orders_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Order was successfully destroyed"
  end
end
