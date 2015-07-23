require 'docking_station'

describe DockingStation do
  it {is_expected.to respond_to(:dock).with(1).argument}
  it {is_expected.to respond_to :release_bike}
  it {is_expected.to respond_to :release_broken}

  it 'releases working bikes' do
    subject.dock double :bike, working?: true
    bike = subject.release_bike
    expect(bike).to be_working
  end
  
  it 'has a default capacity' do
    expect(subject.capacity).to eq DockingStation::DEFAULT_CAPACITY
  end
     
  context 'testing initialized argument' do
    let(:test){ 100 } 
    subject(:testing){DockingStation.new(test)}
    it 'should initilaize with 1 argument' do
      expect(subject.capacity).to eq test
    end
  end

  describe 'dock' do
    it 'raises an error when full' do
      subject.capacity.times {subject.dock :bike}
      expect {subject.dock :bike}.to raise_error 'Docking station full'
    end
  end

  describe '#release_bike' do
    it 'raises an error when there are no bikes available' do
      expect {subject.release_bike}.to raise_error 'No bikes available'
    end
    it "not release broken bikes" do
      bike = double :bike, working?: false  
      subject.dock(bike)
      expect {subject.release_bike}.to raise_error 'No bikes available'
    end
  end

  describe "#release_broken" do
    it "should release all broken bikes" do
      bike = double :bike, working?: false
      subject.dock(bike)
      expect(subject.release_broken).to eq bike
    end
  end

end










