class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.references :service, foreign_key: true
      t.integer :quantidade
      t.string :employee
      t.date :data
      t.time :horaInicio
      t.time :horaFim
      t.string :detalhe

      t.timestamps
    end
  end
end
