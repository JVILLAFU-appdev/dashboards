class DashboardController < ApplicationController

  def home
    render({:template => "convert_template/home.html.erb"})
  end

  def forex

    @raw_data = open("https://api.exchangerate.host/symbols").read
    @parsed_data = JSON.parse(@raw_data)
    @symbols_hash = @parsed_data.fetch("symbols")
    @array_of_symbols = @symbols_hash.keys

    render({:template => "convert_template/forex.html.erb"})
  end

  def step_one

    @from_currency = params.fetch("from")

    @raw_data = open("https://api.exchangerate.host/symbols").read
    @parsed_data = JSON.parse(@raw_data)
    @symbols_hash = @parsed_data.fetch("symbols")
    @array_of_symbols = @symbols_hash.keys

    render({:template => "convert_template/step_one.html.erb"})
  end

  def step_two

    @from_currency = params.fetch("from")
    @to_currency = params.fetch("to")

    @raw_data = open("https://api.exchangerate.host/convert?from="+@from_currency+"&to="+@to_currency).read
    @parsed_data = JSON.parse(@raw_data)
    @fx = @parsed_data.fetch("result")

    render({:template => "convert_template/step_two.html.erb"})
  end

  def covid
    render({:template => "convert_template/covid.html.erb"})
  end

end
