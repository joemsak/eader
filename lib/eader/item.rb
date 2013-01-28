module Eader
  class Item
    attr_accessor :node

    def initialize(node)
      @node = node
    end

    def unitid
      find('did unitid')
    end

    def origination
      find('did origination')
    end

    def langmaterial
      find('did langmaterial')
    end

    def unittitle
      find('did unittitle')
    end

    def scope_content
      find('scopecontent', :html => true)
    end

    def note
      find('note', :html => true)
    end

    def use_restrict
      find('userestrict')
    end

    def unitdate
      find('did unitdate')
    end

    def unitdate_type
      node.css('did unitdate')[0].attr('type')
    end

    private
    def find(selector, options = {})
      results = node.css(selector)
      return nil unless results.any?

      if options[:html]
        results[0].children.to_s
      else
        results[0].text.strip
      end
    end
  end
end
