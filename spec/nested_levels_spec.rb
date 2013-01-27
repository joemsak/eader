require 'spec_helper'

describe "EAD XML with nested levels" do
  let(:doc) { Eader::Document.new('./spec/support/nested_levels.xml') }

  it "returns the nested items" do
    doc.should have(1).items

    i = doc.items.first
    i.unitid.should == '1_ESS'
  end
end
