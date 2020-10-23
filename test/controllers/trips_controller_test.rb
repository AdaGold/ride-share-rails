require "test_helper"

describe TripsController do
  before do
    @passenger = Passenger.create(name: "Cathy", phone_num: "234598739248")
    @driver = Driver.create(name: "Jeta",vin: "12345678912345678", available: true)
    @trip = Trip.new(passenger_id: @passenger.id, driver_id: @driver.id)
  end
  let (:new_trip_hash) {
    {
      trip: {
        passenger_id: @passenger.id,
        driver_id: @driver.id,
      },
    }
  }
  
  describe "show" do
    it "will get show for valid id" do
      @trip.save
      get trip_path(Trip.last.id)
      must_respond_with :success
    end

    it "will respond with not_found for invalid ids" do
      get trip_path(-1)
      must_respond_with :not_found
    end
  end


  describe "create" do
    it "can create a new trip with valid information accurately, and redirect" do      
      expect {
        post passenger_trips_path(@passenger.id)
      }.must_differ "Trip.count", 1
  
      must_redirect_to trip_path(Trip.last.id)
    end
  end


  describe "edit" do
    it "responds with success when getting the edit page for an existing, valid trip" do
      @trip.save
      trip = Trip.first
      get edit_trip_path(trip.id)
      must_respond_with :success
    end

    it "responds with redirect when getting the edit page for a non-existing trip" do
      get edit_trip_path(-1)
      must_respond_with :not_found
    end
  end


  describe "update" do
    it "can update an existing trip with valid information accurately, and redirect" do
      @trip.save
      id = Trip.first.id
      expect {
        patch trip_path(id), params: new_trip_hash
      }.wont_change "Trip.count"

      trip = Trip.find_by(id: id)
      must_redirect_to trip_path(id)
  
      # expect(trip.date).must_equal new_trip_hash[:trip][:date]
      expect(trip.passenger_id).must_equal new_trip_hash[:trip][:passenger_id]
      expect(trip.driver_id).must_equal new_trip_hash[:trip][:driver_id]
      # expect(trip.rating).must_equal new_trip_hash[:trip][:rating]
      # expect(trip.cost).must_equal new_trip_hash[:trip][:cost]
    end

    it "does not update any trip if given an invalid id, and responds with a 404" do
      expect {
        patch trip_path(-1), params: new_trip_hash
      }.wont_change "Trip.count"

      must_respond_with :not_found
    end
  end

 
  describe "destroy" do  
    it "destroys the trip instance in db when trip exists, then redirects" do
      @trip.save
      trip = Trip.first
      expect {
        delete trip_path(trip)
      }.must_differ "Trip.count", -1
  
      must_redirect_to passengers_path
    end
  
    it "does not change the db when the trip does not exist, then responds with " do
      expect {
        delete trip_path(-1)
      }.wont_change "Trip.count"
  
      must_respond_with :not_found
    end
  end
end
