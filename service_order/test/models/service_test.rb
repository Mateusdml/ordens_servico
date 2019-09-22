require 'test_helper'

class ServiceTest < ActiveSupport::TestCase
  test "descricao validation should trigger" do
    assert_not Service.new(valor: "20").save, "Saved the service without a descricao"
  end
  test "service_id validation should trigger" do
    assert_not Service.new(descricao: "Inspeção").save, "Saved the service without a valor"
  end
  test "service should save" do
    assert Service.new(descricao: "Novo Serviço", valor: "20").save, "Could not save the order"
  end
end
