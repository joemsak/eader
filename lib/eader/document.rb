module Eader
   class Document
    attr_reader :path, :file, :doc

    def initialize(path)
      @path = path
      @file = File.open(path)
      @doc  = xml_doc_class.parse(file)
    end

    def content
      file.rewind
      file.read
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
