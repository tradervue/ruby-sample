require './import'

i = Import.new("example","password")

# get import status
status = i.status
puts "Initial import status: #{status}"

# import trades
execs = [
  {
    "datetime" => "2013-02-07T09:53:34-05:00",
    "symbol" => "SPY",
    "quantity" => "qr",
    "price" => "151.05",
    "option" => "",
    "commission" => "1.00",
    "transfee" => "0.04",
    "ecnfee" => "0.21"
  },
  {
    "datetime" => "2013-02-07T09:54:01-05:00",
    "symbol" => "SPY",
    "quantity" => "-100",
    "price" => "150.94",
    "option" => "",
    "commission" => "1.00",
    "transfee" => "0.17",
    "ecnfee" => "0.21"
  }
]

status = i.import_data(execs, ["tag1", "tag2"])
puts "Importing Trades: #{status}"

status = i.status
puts "Import status: #{status}"

puts "Waiting 5 seconds..."
sleep(5)

status = i.status
puts "Import status: #{status}"
