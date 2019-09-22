require 'test_helper'

class OrderTest < ActiveSupport::TestCase
  test "service_id validation should trigger" do
    assert_not Order.new(quantidade: rand(1...100), 
                         employee: Faker::Name.first_name + ' ' + Faker::Name.last_name,
                         data: Faker::Date.between(from: 90.days.ago, to: Date.today),
                         horaInicio: rand(7..12).to_s,
                         horaFim: rand(13..17).to_s, 
                         detalhe: Faker::Lorem.sentence(word_count: rand(0...10), supplemental: true)).save, "Saved the order without a Service"
  end

  test "quantidade validation should trigger" do
    assert_not Order.new(service_id: Service.all.sample.id,
                         employee: Faker::Name.first_name + ' ' + Faker::Name.last_name,
                         data: Faker::Date.between(from: 90.days.ago, to: Date.today),
                         horaInicio: rand(7..12).to_s,
                         horaFim: rand(13..17).to_s, 
                         detalhe: Faker::Lorem.sentence(word_count: rand(0...10), supplemental: true)).save, "Saved the order without a quantidade"
  end

  test "employee validation should trigger" do
    assert_not Order.new(service_id: Service.all.sample.id,
                         quantidade: rand(1...100), 
                         data: Faker::Date.between(from: 90.days.ago, to: Date.today),
                         horaInicio: rand(7..12).to_s,
                         horaFim: rand(13..17).to_s, 
                         detalhe: Faker::Lorem.sentence(word_count: rand(0...10), supplemental: true)).save, "Saved the order without a employee"
  end

  test "data validation should trigger" do
    assert_not Order.new(service_id: Service.all.sample.id,
                         quantidade: rand(1...100), 
                         employee: Faker::Name.first_name + ' ' + Faker::Name.last_name,
                         horaInicio: rand(7..12).to_s,
                         horaFim: rand(13..17).to_s, 
                         detalhe: Faker::Lorem.sentence(word_count: rand(0...10), supplemental: true)).save, "Saved the order without a date"
  end

  test "horaInicio validation should trigger" do
    assert_not Order.new(service_id: Service.all.sample.id,
                         quantidade: rand(1...100), 
                         employee: Faker::Name.first_name + ' ' + Faker::Name.last_name,
                         data: Faker::Date.between(from: 90.days.ago, to: Date.today),
                         horaFim: rand(13..17).to_s, 
                         detalhe: Faker::Lorem.sentence(word_count: rand(0...10), supplemental: true)).save, "Saved the order without a horaInicio"
  end

  test "horaFim validation should trigger" do
    assert_not Order.new(service_id: Service.all.sample.id,
                         quantidade: rand(1...100), 
                         employee: Faker::Name.first_name + ' ' + Faker::Name.last_name,
                         data: Faker::Date.between(from: 90.days.ago, to: Date.today),
                         horaInicio: rand(7..12).to_s,
                         detalhe: Faker::Lorem.sentence(word_count: rand(0...10), supplemental: true)).save, "Saved the order without a horaFim"
  end

  test "detalhe validation should not trigger" do
    assert Order.new(service_id: Service.all.sample.id,
                         quantidade: rand(1...100), 
                         employee: Faker::Name.first_name + ' ' + Faker::Name.last_name,
                         data: Faker::Date.between(from: 90.days.ago, to: Date.today),
                         horaInicio: rand(7..12).to_s,
                         horaFim: rand(13..17).to_s,).save, "Could not save the order without a detalhe"
  end

  test "Order should save" do
    assert Order.new(service_id: Service.all.sample.id,
                         quantidade: rand(1...100), 
                         employee: Faker::Name.first_name + ' ' + Faker::Name.last_name,
                         data: Faker::Date.between(from: 90.days.ago, to: Date.today),
                         horaInicio: rand(7..12).to_s,
                         horaFim: rand(13..17).to_s,
                         detalhe: Faker::Lorem.sentence(word_count: rand(0...10), supplemental: true)).save, "Could not save the order"
  end
end
