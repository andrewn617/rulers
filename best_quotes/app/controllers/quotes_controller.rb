class QuotesController < Rulers::Controller
  def a_quote
    render :a_quote, noun: :winking
  end

  def quote_1
    quote = FileModel.find(1)
    render :quote, obj: quote
  end

  def new_quote
    attrs = {
      "submitter" => "Web user",
      "quote" => "Wazzaa",
      "attribution" => "Andrew"
    }
    new_record = FileModel.create(attrs)
    render :quote, obj: new_record
  end

  def update
    quote = FileModel.find(1)
    quote.update(
      quote: "Come with me if you want to live!!",
      attribution: "Arnold"
    )
    render :quote, obj: quote
  end

  def exception
    raise "It's a bad one!"
  end
end
