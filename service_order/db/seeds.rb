puts "Criando Serviços..."
Service.create!([{descricao: "Inspeção", valor: "20"},
                 {descricao: "Nova Ligação", valor: "35"},
                 {descricao: "Corte de Energia", valor: "45"},
                 {descricao: "Religação de Energia", valor: "30"}])
puts "Serviços criados: Inspeção, Nova Ligação, Corte de Energia e Religação de Energia."

puts "Criando Ordens de Serviços..."
    30.times do |i|
        Order.create!([{service_id: Service.all.sample.id,
                quantidade: rand(1...100), 
                employee: Faker::Name.first_name + ' ' + Faker::Name.last_name,
                data: Faker::Date.between(from: 90.days.ago, to: Date.today),
                horaInicio: rand(7..12).to_s,
                horaFim: rand(13..17).to_s, 
                detalhe: Faker::Lorem.sentence(word_count: rand(0...10), supplemental: true)}])
    end            
puts "Ordens de Serviços criadas."                
