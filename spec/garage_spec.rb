require 'garage'

describe Garage do
  it {is_expected.to respond_to(:dock).with(1).argument}
  it {is_expected.to respond_to :release_bike}
  
  it 'releases working bikes' do
    subject.dock double :bike, working?: true
    bike = subject.release_bike
    expect(bike).to be_working
  end
  
  it 'has a default capacity' do
    expect(subject.capacity).to eq Garage::DEFAULT_CAPACITY
  end
  
    context 'testing initialized argument' do
    let(:test){ 100 } 
      subject(:testing){Garage.new(test)}
    it 'should initilaize with 1 argument' do
      expect(subject.capacity).to eq test
    end
  end

  describe 'dock' do
    it 'raises an error when full' do
      subject.capacity.times {subject.dock :bike}
      expect {subject.dock :bike}.to raise_error 'Garage full'
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
end
