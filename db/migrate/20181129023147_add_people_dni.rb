class AddPeopleDni < ActiveRecord::Migration[5.2]
  def change
    add_column :people, :dni, :string, default: ''

    Person.all.each do |person|
      person.update!(dni: SecureRandom.random_number(9999999).to_s)
    end
  end
end
