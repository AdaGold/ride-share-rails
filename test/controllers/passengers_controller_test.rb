require "test_helper"

describe PassengersController do
  before do
    @passenger = Passenger.new(name: "We're all wonders", phone_num: "9340983094")
  end
  let (:new_passenger_hash) {
    {
      passenger: {
        name: "Cathy Cathy",
        phone_num: "90482309480924"
      },
    }
  }

  describe "index" do
    it "responds with success when there are many passenger saved" do
      get "/passengers"
      must_respond_with :success
    end

    it "responds with success when there are no passenger" do
      get "/passengers" 
      must_respond_with :success
    end
  end


  describe "show" do
    it "will get show for valid id" do
      @passenger.save
      valid_passanger_id = @passenger.id
      get passenger_path(valid_passanger_id)
      must_respond_with :success
    end

    it "will respond with not_found for invalid ids" do
      get passenger_path(-1)
      must_respond_with :not_found
    end
  end


  describe "new" do
    it "resonse with succes" do
      get new_passenger_path
      must_respond_with :success
    end
  end
   

  describe "create" do
    it "can create a passanger" do
      passenger_hash = {
        passenger: {
          id: 10,
          name: "Cathy Cathy",
          phone_num: "8783 93093 3983",
        }
      }

      expect {
        post passengers_path, params: passenger_hash
      }.must_differ 'Passenger.count', 1
  
      must_respond_with :redirect
      must_redirect_to passenger_path(Passenger.last.id)

      expect(Passenger.last.name).must_equal passenger_hash[:passenger][:name]
      expect(Passenger.last.phone_num).must_equal passenger_hash[:passenger][:phone_num]
    end

    it "does not create a passenger if phone number is not present, and responds with a redirect" do
      passenger_hash1 = {
        passenger: {
          name: "We're all Wonderful!"
        }
      }
 
      expect {
        post passengers_path, params: passenger_hash1
      }.wont_change "Passenger.count"

      assert_response :bad_request
    end

    it "does not create a passenger if name is not present, and responds with a redirect" do
      passenger_hash2 = {
        passenger: {
          phone_num: "4259997777",
        }
      }

      expect {
        post passengers_path, params: passenger_hash2
      }.wont_change "Passenger.count"

      assert_response :bad_request
    end
  end
  

  describe "edit" do
   it "responds with success when getting the edit page for an existing, valid passenger" do
      @passenger.save
      passenger = Passenger.first
      get edit_passenger_path(passenger.id)
      must_respond_with :success
   end

   it "responds with redirect when getting the edit page for a non-existing passenger" do
      get edit_passenger_path(-1)
      must_respond_with :not_found
   end
  end

  
  describe "update" do
    it "can update an existing passanger with valid information accurately, and redirect" do
      @passenger.save
      id = Passenger.first.id
      expect {
        patch passenger_path(id), params: new_passenger_hash
      }.wont_change "Passenger.count"

      passanger = Passenger.find_by(id: id)
      must_redirect_to passenger_path(passanger.id)
  
      expect(passanger.name).must_equal new_passenger_hash[:passenger][:name]
      expect(passanger.phone_num).must_equal new_passenger_hash[:passenger][:phone_num]
    end

    it "does not update any passenger if given an invalid id, and responds with a 404" do
      id = -1
      expect {
        patch passenger_path(id), params: new_passenger_hash
      }.wont_change "Passenger.count"

      must_respond_with :not_found
    end
  
    it "does not update a passenger if name is not present, and responds with a redirect" do
      @passenger.save
      edit_passenger_hash = {
        passenger: {
          name: "",
        }
      }
      id = Passenger.first.id
      expect {
        patch passenger_path(id), params: edit_passenger_hash
      }.wont_change "Passenger.count"

      assert_response :bad_request
    end

    it "does not update a passenger if phone number is not present, and responds with a redirect" do
      @passenger.save
      edit_passenger_hash = {
        passenger: {
          phone_num: "",
        }
      }
      id = Passenger.first.id
      expect {
        patch passenger_path(id), params: edit_passenger_hash
      }.wont_change "Passenger.count"

      assert_response :bad_request
    end
  end
  
  describe "destroy" do
    it "destroys the passenger instance in db when passenger exists, then redirects" do
      @passenger.save
      passanger = Passenger.first
      expect {
        delete passenger_path(passanger.id)
      }.must_differ "Passenger.count", -1

      must_redirect_to passengers_path
    end
  
    it "does not change the db when the passenger does not exist, then responds with " do
      expect {
        delete passenger_path(-1)
      }.wont_change "Passenger.count"

      must_respond_with :not_found
    end
  end
end



