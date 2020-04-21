class CorrectTypoInColname < ActiveRecord::Migration
  def change
    change_column :recipes, :ingridents, :ingridents
  end
end
