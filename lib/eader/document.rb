module Eader
   class Document
    attr_reader :doc

    def initialize(path)
      file = File.open(path)
      @doc = xml_doc_class.parse(file)
    end

    def items
      dsc_levels.map do |d|
        Item.new(d.css('did'))
      end
    end

    def dsc_levels
      doc.css('dsc c01')
    end

    private
    def xml_doc_class
      Nokogiri::XML::Document
    end
  end
end
