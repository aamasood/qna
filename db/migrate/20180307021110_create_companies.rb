class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.string :name
      t.string :address
      t.boolean :public_company

      t.timestamps

    end
  end
end
