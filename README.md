# AgnosticPresenters

AgnosticPresenters is a gem that allow you to have presenters for your objects with a minimal syntax (because we are lazy).

## TODO

* Rename Base and Helper.
* Do a proper tweak of Proxen

## Usage

<pre><code>require "rubygems"
gem "yeastymobs-agnostic_presenters"
require "agnostic_presenters"

Class.send :include, AgnosticPresenters::Helper

class MyModel

  # ...
  
  presenters do
    
    def myattribute
      "#{object.fancy} with a presenter"
    end
    
  end
end

@model = MyModel.new(:myattribute => "fancy")
@model.myattribute  # => fancy
@model.myattribute! # => fancy with a presenter</code></pre>

And you can share helpers between presenters with just a line:

<pre><code>module Helpers
  def escape(string)
    Rack::Utils.escape(string)
  end
end

AgnosticPresenters::Base.send :include, Helpers</code></pre>

## Usage with Rails

<pre><code>config.gem "yeastymobs-agnostic_presenters", :lib => "agnostic_presenters/activerecord", :source => "http://gems.github.com"</code></pre>

And now you have presenters in your models which include ActionView helpers:

<pre><code>class Article < ActiveRecord::Base
  presenters do
  
    def title
      h object.title
    end
    
    def slug
      object.title.parameterize
    end
    
  end
end</code></pre>

If you use another ORM, just change "activerecord".

## Supported ORMs

* ActiveRecord "agnostic_presenters/activerecord"
* MongoMapper "agnostic_presenters/mongomapper"

## Credits

* Nicolas Mérouze
* A part of code is taken from active-record-presenters plugin
* The proxy part is from nakajima-proxen gem