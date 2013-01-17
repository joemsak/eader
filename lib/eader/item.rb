module Eader
  class Item
    attr_accessor :node

    def initialize(node)
      @node = node
    end

    def unitid
      if (uid = node.css('unitid')).any?
        uid[0].text.strip
      end
    end

    def origination
      if (orig = node.css('origination')).any?
        orig[0].text.strip
      end
    end

    def langmaterial
      if (langm = node.css('langmaterial')).any?
        langm[0].text.strip
      end
    end

    def unittitle
      if (ut = node.css('unittitle')).any?
        ut[0].text.strip
      end
    end

    def unitdate
      if _unit_dates.any?
        _unit_dates[0].text.strip
      end
    end

    def unitdate_type
      if _unit_dates.any?
        _unit_dates[0].attr('type')
      end
    end

    private
    def _unit_dates
      node.css('unitdate')
    end
  end
end
