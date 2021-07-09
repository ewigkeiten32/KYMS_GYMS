class AddAboutMeToTrainers < ActiveRecord::Migration[6.0]
  def change
    add_column :trainers, :about_me, :text
  end
end
