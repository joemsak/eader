require "spec_helper"

describe Eader do
  let!(:e) { Eader::Document.new('./spec/support/test.xml') }
  let(:i) { Eader::Document.new(ENV['REMOTE_URL']) }
  let(:item) { e.items.first }

  it "returns items" do
    e.should have(1).items

    # checking that remote url works
    i.should have(4434).items
  end

  it "returns item unitids" do
    item.unitid.should == 'MR-0002'
  end

  it "returns item originations" do
    item.origination.should == "N/A"
  end

  it "returns the langmaterial" do
    item.langmaterial.should == "English"
  end

  it "returns the unittitle" do
    item.unittitle.should == "5 empty loose CD jewel cases [sound recording]"
  end

  it "returns the unitdate" do
    item.unitdate.should be_empty
    item.unitdate_type.should == "inclusive"
  end
end
