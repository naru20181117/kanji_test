class CreateKanjis < ActiveRecord::Migration[6.1]
  def change
    create_table :kanjis do |t|
      t.string :kanji
      t.string :meaning
      t.string :yomi

      t.timestamps
    end
  end
end
