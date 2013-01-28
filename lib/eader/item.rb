module Eader
  class Item
    attr_accessor :node

    def initialize(node)
      @node = node
    end

    def unitid
      if (uid = node.css('did unitid')).any?
        uid[0].text.strip
      end
    end

    def origination
      if (orig = node.css('did origination')).any?
        orig[0].text.strip
      end
    end

    def langmaterial
      if (langm = node.css('did langmaterial')).any?
        langm[0].text.strip
      end
    end

    def unittitle
      if (ut = node.css('did unittitle')).any?
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

    def scope_content
      if (sc = node.css('scopecontent')).any?
        sc[0].children.to_s
      end
    end

    def note
      if (n = node.css('note')).any?
        n[0].children.to_s
      end
    end

    private
    def _unit_dates
      node.css('did unitdate')
    end
  end
end
