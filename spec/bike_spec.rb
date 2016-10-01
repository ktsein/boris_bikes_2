require 'docking_station'
require 'bike'
require 'van'
require 'garage'

describe Bike do
  #it 'allows user to be able to report the broken bike' do
    #expect(su)
  it 'checks if the bike is faulty' do
    expect(subject.working).to eq true
  end
  it 'the user can report when docking' do
    bike = Bike.new
    station = DockingStation.new
    station.dock_bike(bike, 'broken')
    expect(bike.working).to eq false
  end
end
