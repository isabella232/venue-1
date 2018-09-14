class CreateTicketVariants < ActiveRecord::Migration[5.2]
  def change
    create_table :ticket_variants do |t|
      t.string :name
      t.float :base_price_percentage
      t.references :ticket, foreign_key: true

      t.timestamps
    end
  end
end
