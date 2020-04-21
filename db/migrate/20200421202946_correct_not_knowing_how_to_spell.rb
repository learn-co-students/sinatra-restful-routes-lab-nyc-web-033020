class CorrectNotKnowingHowToSpell < ActiveRecord::Migration
  def change
    drop_table :recipes
    create_table :recipes do |t|
      t.string :name
      t.string :ingredients
      t.string :cook_time
    end
  end
end
