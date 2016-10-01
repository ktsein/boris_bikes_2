require 'docking_station'
require 'bike'
require 'van'
require 'garage'

describe Van do

    #van = Van.new
    bike = Bike.new
    station = DockingStation.new
    station.dock_bike(bike, 'broken')

    it 'takes the broken bikes from the station' do
      expect(subject.take_bikes).to eq @broken_bikes
    end

    it 'delivers the broken bikes to the garage' do
      expect(subject.deliver_bikes).to eq @bikes_garage
    end

end
