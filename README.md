# README

A simple example showing a Rails app using the `wicked_pdf` gem and `wkhtmltopdf` library running on the heroku-18 stack.

1. Add `wicked_pdf` to the Gemfile:
gem 'wicked_pdf', '~> 1.2', '>= 1.2.2'

2. Run `$ bundle install`

3. Run `rails generate wicked_pdf`

4. Create a simple PDF endpoint:
```
class PdfController < ApplicationController
  def index
    url = params[:url].present? ? params[:url] : 'https://www.heroku.com'
    pdf = WickedPdf.new.pdf_from_url(url)
    send_data pdf, filename: "#{url.parameterize}-#{Time.now.to_i}.pdf"
  end
end
```

5. Add the `wkhtmltopdf` buildpack:
```
$ heroku buildpacks:add https://github.com/chap/wkhtmltopdf-heroku-18-buildpack --index 1
```

6. Deploy to Heroku
