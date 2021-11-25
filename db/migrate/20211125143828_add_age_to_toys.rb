class AddAgeToToys < ActiveRecord::Migration[6.0]
  def change
    add_column :toys, :age, :integer
  end
end
