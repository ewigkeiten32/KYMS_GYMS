class AddReferencetoTrainer < ActiveRecord::Migration[6.0]
  def change
    add_reference :trainers, :user
  end
end
