class QuotesController < Rulers::Controller
  def a_quote
    "There gis nothing either good or bad!! " + "but thinking makes it so."
  end

  def exception
    raise "It's a bad one!"
  end
end
