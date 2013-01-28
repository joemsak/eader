# Eader

Parse EAD xml easily

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'eader', '~> 0.0.4'
```

And then execute:

```
$ bundle
```

## Usage

```ruby
doc = Eader::Document.new('/path/or/url/to/file.xml')
doc.items      #=> [#<Eader::Item ...>, #<Eader::Item ...>, etc...]


item = doc.items.first

item.unitid        #=> 'MR-0002'
item.origination   #=> 'N/A'
item.langmaterial  #=> 'English'
item.unittitle     #=> '5 empty loose CD jewel cases [sound recording]'
item.unitdate      #=> 'Jan 15, 2001'
item.unitdate_type #=> 'inclusive'
item.scope_content #=> '<p>Usually there is html in here</p>'
item.note          #=> '<p>Also usually html in here</p>'
item.use_restrict  #=> 'The copyright notice usually is here'
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
