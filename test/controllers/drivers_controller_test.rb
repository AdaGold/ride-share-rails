require "test_helper"

describe DriversController do
  describe "index" do
    it "responds with list of Drivers when there are drivers in db" do
      # Your code here
    end

    it "Provides clear messaging to user when there are no drivers in db" do
      # Your code here
    end
  end

  describe "show" do
    it "Shows all relavant driver information and aggregated data when Driver exists" do
    end

    it "Responds with not_found when Driver does not exist" do
    end
  end

  describe "edit" do
    it "Provides all relevant driver fiels to be updated when driver exists" do
    end

    it "Responds with not_found when Driver does not exist" do
    end
  end

  describe "update" do
    it "Updates all relevant driver fields to be updated when driver exists" do
    end

    it "Responds with not_found when Driver does not exist" do
    end
  end

  describe "new" do
    it "Displays all relevant driver fiels to be given by user" do
    end
  end

  describe "create" do
    it "Creates new Driver in db with fields given by user" do
    end

    it "Redirects user back to new_driver page when a required field is missing" do
    end
  end

  describe "destroy" do
    it "Destroys the driver instance in db when driver exists" do
    end

    it "Responds with not_found when Driver does not exist" do
    end
  end
end
