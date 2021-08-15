class TestPdf < Prawn::Document

  def initialize(records)

    super(
      page_size: 'A4',
      top_margin: 40,
      bottom_margin: 30,
      left_margin: 20,
      right_margin: 20
    )

    font 'app/assets/fonts/ipaexg.ttf'
    @records = records
  end
end
