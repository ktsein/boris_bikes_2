require 'docking_station'
require 'bike'
require 'van'
require 'garage'

describe DockingStation do

    bike = Bike.new
    #station = DockingStation.new

    it {is_expected.to respond_to :release_bike}

    let(:bike) {double :bike}
    it 'releases previously docked bike' do
      #bike = double(:bike) #refer to class
      allow(bike).to receive(:working).and_return(true)
      subject.dock_bike(bike)
      expect(subject.release_bike).to eq bike
    end
    it "raise an error if there is no bikes" do
      expect {subject.release_bike}.to raise_error('sorry no bikes available')
    end

    it {is_expected.to respond_to(:dock_bike).with(1).argument}
    it 'store the bike?' do
      #bike = double(:bike) #refer to class
      #allow(bike).to receive(:bike)
      subject.dock_bike(bike)
      expect(subject.bikes).to include (bike)
    end
    it 'raise an error if the station already has 20 bikes docked' do
      DockingStation::DEFAULT_CAPACITY.times { subject.dock_bike(bike)} #refer to class
      expect { subject.dock_bike(bike)}.to raise_error('sorry this station is full') #refer to class
    end

    it 'can take an input of capacity when initialized' do
      expect(DockingStation.new(30).capacity).to eq 30
    end

    it 'will have a capacity equal to the default if none specified' do
      expect(subject.capacity).to eq DockingStation::DEFAULT_CAPACITY
    end

    it 'will not release a bike if it\'s broken' do
      #bike = double(:bike)#refer to class
      allow(bike).to receive(:working).and_return(false)
      subject.dock_bike(bike)
      expect {subject.release_bike}.to raise_error("This bike is faulty")
    end

    it 'stores broken bikes from the docking station separately' do
      #bike = Bike.new
      subject.dock_bike(bike, 'broken')
      expect(subject.stored_broken_bikes).to include (bike)
    end

    #it 'fixes the broken bikes in the garage'
      #bike = Bike.new
      #subject.dock_bike(bike, 'broken')
      #subject.take_broken_bikes
      #expect(subject.fix_bikes).to eq true
    #end

    #it 'prevents the system taking the same bike multiple times' do
      #bike1 = Bike.new
      #station = DockingStation.new
      #station.dock_bike(bike1)
      #expect {station.dock_bike(bike1)}.to raise_error("Can't dock the same bike multiple times")
    #end

end
