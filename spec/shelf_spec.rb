require "spec_helper"

require_relative "../shelf"

describe Shelf do
  let!(:shelf) { Shelf.new }

  describe "methods" do
    describe "#total_volume" do
      it "has method total_volume" do
        shelf.should respond_to(:total_volume)
      end

      it "default value is 0" do
        shelf.total_volume.should == 0
      end
    end

    describe "#contents" do
      it "has method contents" do
        shelf.should respond_to(:contents)
      end

      it "default value is empty hash" do
        shelf.contents.should == {}
      end

      it "allows to add item to shelf contents" do
        shelf.contents["Sandman"] = 88
        shelf.contents["Sandman"].should == 88
      end
    end

    context "with content" do
      before do
        shelf.contents["Sandman"] = 88
        shelf.contents["Dustman"] = 75
      end

      it "prints list of books" do
        shelf.list.should == "Sandman: 88 pages\nDustman: 75 pages"
      end

      it "returns correct total volume" do
        shelf.total_volume.should == 163
      end
    end
  end
end
