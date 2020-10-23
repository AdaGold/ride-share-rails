require "test_helper"

describe DriversController do
  # Note: If any of these tests have names that conflict with either the requirements or your team's decisions, feel empowered to change the test names. For example, if a given test name says "responds with 404" but your team's decision is to respond with redirect, please change the test name.

  before do
    @driver = Driver.new(name: "Lightning Mcqueen", vin: "12345678912345678", available: true)
  end
  
  let (:driver_hash) {
    {
      driver: {
        name: "Speed", 
        vin: "12345678912345678",
      }
    }
  }

  describe "index" do
    it "responds with success when there are many drivers saved" do
      # Ensure that there is at least one Driver saved
      @driver.save
      get drivers_path
      must_respond_with :success
    end

    it "responds with success when there are no drivers saved" do
      # Ensure that there are zero drivers saved
      get drivers_path
      must_respond_with :success
    end
  end

  describe "show" do
    it "responds with success when showing an existing valid driver" do
      # Ensure that there is a driver saved
      @driver.save
      get driver_path(@driver.id)
      must_respond_with :success
    end

    it "responds with 404 with an invalid driver id" do
      # Ensure that there is an id that points to no driver
      get driver_path(-1)
      must_respond_with :not_found
    end
  end

  describe "new" do
    it "responds with success" do
      get new_driver_path
      must_respond_with :success
    end
  end

  describe "create" do
    it "can create a new driver with valid information accurately, and redirect" do
      # Ensure that there is a change of 1 in Driver.count
      expect { 
        post drivers_path, params: driver_hash
      }.must_differ "Driver.count", 1

      # Find the newly created Driver, and check that all its attributes match what was given in the form data
      expect(Driver.last.name).must_equal driver_hash[:driver][:name]
      expect(Driver.last.vin).must_equal driver_hash[:driver][:vin]

      # Check that the controller redirected the user
      must_redirect_to driver_path(Driver.last.id)
    end


    it "does not create a driver if vin is not present, and responds with a redirect" do
      driver_hash1 = {
        driver: {
          name: "Drivers are all Wonderful!"
        }
      }
 
      expect {
        post drivers_path, params: driver_hash1
      }.wont_change "Driver.count"

      assert_response :bad_request
    end

    it "does not create a driver if name is not present, and responds with a redirect" do
      driver_hash2 = {
        driver: {
          vin: "12345678901234567"
        }
      }
 
      expect {
        post drivers_path, params: driver_hash2
      }.wont_change "Driver.count"

      assert_response :bad_request
    end

    it "does not create a driver if vin is shorter than 17 chars, and responds with a redirect" do
      driver_hash2 = {
        driver: {
          name: "Valid Name",
          vin: "12345678",
        }
      }
 
      expect {
        post drivers_path, params: driver_hash2
      }.wont_change "Driver.count"

      assert_response :bad_request
    end
  end
  
  describe "edit" do
    it "responds with success when getting the edit page for an existing, valid driver" do
      # Ensure there is an existing driver saved
      @driver.save

      get edit_driver_path(@driver.id)
      must_respond_with :success
    end

    it "responds with redirect when getting the edit page for a non-existing driver" do
      # Ensure there is an invalid id that points to no driver
      get edit_driver_path(-1)
      must_respond_with :not_found
    end
  end

  describe "update" do
    it "can update an existing driver with valid information accurately, and redirect" do
      # Ensure there is an existing driver saved
      @driver.save
      id = Driver.last.id

      expect {
        patch driver_path(id), params: driver_hash
      }.wont_change "Driver.count"

      # Use the local variable of an existing driver's id to find the driver again, and check that its attributes are updated
      edited_driver = Driver.find(id)
      expect(edited_driver.name).must_equal driver_hash[:driver][:name]
      expect(edited_driver.vin).must_equal driver_hash[:driver][:vin]

      # Check that the controller redirected the user
      must_redirect_to driver_path(id)
    end

    it "does not update any driver if given an invalid id, and responds with a 404" do
      # Ensure there is an invalid id that points to no driver
      expect {
        patch driver_path(-1), params: driver_hash
      }.wont_change "Driver.count"

      # Check that the controller gave back a 404
      must_respond_with :not_found
    end

    it "does not update a driver if name is not present, and responds with a redirect" do
      @driver.save
      edit_driver_hash = {
        driver: {
          name: "",
        }
      }
      id = Driver.first.id
      expect {
        patch driver_path(id), params: edit_driver_hash
      }.wont_change "Driver.count"

      assert_response :bad_request
    end

    it "does not update a driver if vin is not present, and responds with a redirect" do
      @driver.save
      edit_driver_hash = {
        driver: {
          vin: "",
        }
      }
      id = Driver.first.id
      expect {
        patch driver_path(id), params: edit_driver_hash
      }.wont_change "Driver.count"

      assert_response :bad_request
    end

    it "does not update a driver if vin is less than 17 chars, and responds with a redirect" do
      @driver.save

      driver_hash2 = {
        driver: {
          name: "Valid Name",
          vin: "12345678",
        }
      }
      id = Driver.first.id
      expect {
        patch driver_path(id), params: driver_hash2
      }.wont_change "Driver.count"

      assert_response :bad_request
    end
  end

  describe "destroy" do
    it "destroys the driver instance in db when driver exists, then redirects" do
      @driver.save

      expect {
        delete driver_path(@driver.id)
      }.must_differ "Driver.count", -1

      must_redirect_to drivers_path
    end

    it "does not change the db when the driver does not exist, then responds with " do
      @driver.save
      expect {
        delete driver_path(-1)
      }.wont_change "Driver.count"
      must_respond_with :not_found
    end
  end

  describe "make_available" do
    it "make driver available if driver is unavailable" do
      new_driver = Driver.create(name: "Lightning Mcqueen", vin: "12345678912345678", available: false)

    
      patch make_available_path(new_driver.id)
      expect(Driver.last.available).must_equal true

      must_redirect_to driver_path(new_driver.id)
    end

    it "make driver unavailable if driver is available" do
      @driver.save

      patch make_available_path(@driver.id)
      expect(Driver.last.available).must_equal false

      must_redirect_to driver_path(@driver.id)
    end
  end
end
