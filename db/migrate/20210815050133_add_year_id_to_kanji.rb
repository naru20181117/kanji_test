class AddYearIdToKanji < ActiveRecord::Migration[6.1]
  def change
    add_reference :kanjis, :year, default: 0
  end
end
