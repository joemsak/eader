require 'open-uri'

module Eader
   class Document
    attr_reader :doc

    def initialize(path)
      file = open(path)
      @doc = xml_doc_class.parse(file)
    end

    def series
      doc.css('dsc c01').map do |c|
        if c['level'] == 'series'
          Item.new(c)
        end
      end.compact
    end

    def subseries
      doc.css('dsc c02').map do |c|
        if c['level'] == 'subseries'
          Item.new(c)
        end
      end.compact
    end

    def items
      @items ||= []

      (1..3).each do |n|
        doc.css("dsc c0#{n}").map do |c|
          if c['level'] == 'item'
            @items << Item.new(c)
          end
        end
      end

      @items.compact
    end

    private
    def xml_doc_class
      Nokogiri::XML::Document
    end
  end
end
