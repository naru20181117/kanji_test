class TestPdf < Prawn::Document

  def initialize(records, year)

    super(
      page_size: 'A4',
      top_margin: 40,
      bottom_margin: 30,
      left_margin: 20,
      right_margin: 20
    )

    # stroke_axis
    font 'app/assets/fonts/ipaexg.ttf'
    @records = records.shuffle

    repeat :all do
      draw_text "#{year}年生 漢字テスト", :at => [250, 790], size: 10
      draw_text "作成日 #{Time.now.strftime('%Y年%m月%d日')}", :at => [430, 790], size: 10
    end

    bounding_box([0, cursor], width: 560, height: 780) do |x|
      contain
    end

    number_pages '- <page> -', at: [260, -3]
  end

  def contain
    turn_num = (@records.count / 10) + 1
    each_record = @records.in_groups(turn_num)

    turn_num.times do |n|
      array = []
      i = 1
      each_record[n].map do |record|
        array << record&.kanji
        i =+ 1
        break if i > 10
      end
      table [array], column_widths: 50, position: :center do |table|
        table.cells.height = 30
      end

      nulls = [[''] * 10]
      table nulls, column_widths: 50, position: :center do |table|
        table.cells.height = 50
      end
      move_down 15
    end
  end
end
