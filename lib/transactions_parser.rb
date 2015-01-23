require 'csv'
require_relative 'transactions'

class TransactionsParser
  attr_reader :filename, :se_self

  def initialize(filename, se_self)
    @filename = filename
    @se_self
  end

  def parse
    file = CSV.open(filename, :headers => true, :header_converters => :symbol)
    file.map do |line|
      Transactions.new(line, se_self)
    end
  end
end
