require "test_helper"

describe Driver do
  let (:new_driver) {
    Driver.new(name: "Kari", vin: "12345678912345678", available: true)
  }
  it "can be instantiated" do
    # Assert
    expect(new_driver.valid?).must_equal true
  end

  it "will have the required fields" do
    # Arrange
    new_driver.save
    driver = Driver.first
    [:name, :vin, :available].each do |field|

      # Assert
      expect(driver).must_respond_to field
    end
  end

  describe "relationships" do
    it "can have many trips" do
      # Arrange
      new_driver.save
      new_passenger = Passenger.create(name: "Kari", phone_num: "111-111-1211")
      trip_1 = Trip.create(driver_id: new_driver.id, passenger_id: new_passenger.id, date: Date.today, rating: 5, cost: 1234)
      trip_2 = Trip.create(driver_id: new_driver.id, passenger_id: new_passenger.id, date: Date.today, rating: 3, cost: 6334)
      # Assert
      expect(new_driver.trips.count).must_equal 2
      new_driver.trips.each do |trip|
        expect(trip).must_be_instance_of Trip
      end
    end
  end

  describe "validations" do
    it "must have a name" do
      # Arrange
      new_driver.name = nil

      # Assert
      expect(new_driver.valid?).must_equal false
      expect(new_driver.errors.messages).must_include :name
      expect(new_driver.errors.messages[:name]).must_equal ["can't be blank"]
    end

    it "must have a VIN number" do
      # Arrange
      new_driver.vin = nil

      # Assert
      expect(new_driver.valid?).must_equal false
      expect(new_driver.errors.messages).must_include :vin
      expect(new_driver.errors.messages[:vin]).must_equal ["can't be blank", "is the wrong length (should be 17 characters)"]
    end
  end

  # Tests for methods you create should go here
  describe "custom methods" do
    before do
      new_driver.save
      new_passenger = Passenger.create!(name: "PassengerWinkWink", phone_num: "1234567890")
      @trip1 = Trip.create!(passenger_id: new_passenger.id, driver_id: new_driver.id, cost: 10, rating: 5)
      @trip2 = Trip.create!(passenger_id: new_passenger.id, driver_id: new_driver.id, cost: 50, rating: 4)
    end
    
    describe "total earnings" do
      it "returns the total earnings of all the driver's trips" do
        costs = ((@trip1.cost + @trip2.cost) - 1.65 * 2) * 0.8
        expect(new_driver.total_earnings).must_equal costs.round(2)
      end
    end

    describe "average rating" do
      it "returns the correct average rating for the driver" do
        ratings = (@trip1.rating.to_f + @trip2.rating.to_f) / 2
        expect(new_driver.avg_rating).must_equal ratings.round(1)
      end
    end
  end
end
