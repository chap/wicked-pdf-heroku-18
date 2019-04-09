class PdfController < ApplicationController
  def index
    url = params[:url].present? ? params[:url] : 'https://www.heroku.com'
    pdf = WickedPdf.new.pdf_from_url(url)
    send_data pdf, filename: "#{url.parameterize}-#{Time.now.to_i}.pdf"
  end
end