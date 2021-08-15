class YearsController < ApplicationController
  def index
    @years = Year.all
  end

  def show
    @year = Year.find(params[:id])
  end

  def pdf
    @tests = Kanji.where(year_id: params[:id])
    respond_to do |format|
      format.html
      format.pdf do

        pdf = TestPdf.new(@tests, params[:id])

        send_data pdf.render,
          filename:    "kanji_test.pdf",
          type:        "application/pdf",
          disposition: "inline" # 画面に表示。外すとダウンロードされる。
      end
    end
  end
end
