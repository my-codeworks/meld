#require 'spec_helper'
require 'meld'

describe Meld::Merge do

  context "not correctly initialized" do
    it "raises error when created without arguments" do
      expect { Meld::Merge.new }.to raise_error ArgumentError
    end
  end

end