class Order < ApplicationRecord
  belongs_to :service
    validates :service_id, :quantidade, :employee, :data, :horaInicio, :horaFim, presence: true
end
