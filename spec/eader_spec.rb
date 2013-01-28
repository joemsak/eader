require "spec_helper"

describe Eader do
  let!(:e) { Eader::Document.new('./spec/support/test.xml') }
  let(:i) { Eader::Document.new(ENV['REMOTE_URL']) }
  let(:item) { e.items.first }

  it "returns items" do
    e.should have(1).items

    # checking that remote url works
    if ENV['REMOTE_URL']
      i.should have(4434).items
    end
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

  it "returns items' scope_content" do
    item.scope_content.should == "<p>Thurman Barker, percussion</p><p>Recorded live 1987.03.21, Links Hall, 3435 N. Sheffield, Chicago, IL 60657</p><p>Contents: [Introduction] (2 min. 17 sec.) -- [\"The Hunt\"] (11 min. 7 sec.) --[Untitled] (11 min. 19 sec.) -- [Untitled] (10 min. 42 sec.) -- [\"Blue ingreen\"] (12 min. 5 sec.) -- [Intermission] (2 min. 40 sec.) --[\"Kalingalinga\"] (17 min. 1 sec.) -- [\"Hocus Pocus\"] (21 min. 15 sec.) --[Outro] (2 min. 19 sec.)</p>"
  end

  it "returns items' note" do
  end

  it "returns items' user_restrict" do
  end
end
