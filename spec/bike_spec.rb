require 'bike'

describe Bike do
  it {is_expected.to respond_to :working?}
<<<<<<< HEAD
  
=======
  it {is_expected.to respond_to :report_broken}

  it "reporting broken changes working? to false" do
    subject.report_broken
    expect(subject.working?).to eq false
  end
>>>>>>> 4a03b3bb727b09f8c69d99a76e038403661ce72d
end



