require "erubis"

template = <<TEMPLATE
  Hello! This is a Template
  It has a <%= whatever %>
TEMPLATE

eruby = Erubis::Eruby.new(template)
puts eruby.src
puts "=" * 10
puts eruby.result(whatever: "Hello! This is a Template")

