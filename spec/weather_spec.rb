require 'weather'

describe Weather do
  it 'randomiser returns a random value between 0 and 3' do
    today_weather = Weather.new
    expect(today_weather.random).to be_between(0,2)
  end

  it 'if randomiser returns 0 then weather return stormy' do
    today_weather = Weather.new
    today_weather.stub(:random) { 0 }
    expect(today_weather.weather).to eq("STORMY")
  end

  it "if randomiser returns 1 then weather returns sunny" do
    today_weather = Weather.new
    today_weather.stub(:random) { 1 }
    expect(today_weather.weather).to eq("SUNNY")
  end

  it "if randomiser returns 2 then weather returns sunny" do
    today_weather = Weather.new
    today_weather.stub(:random) { 2 }
    expect(today_weather.weather).to eq("SUNNY")
  end

end
