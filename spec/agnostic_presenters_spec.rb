require "rubygems"
require "spec"
require "rack"

$:.push File.join(File.dirname(__FILE__), "../lib")
require "agnostic_presenters"

# Helpers

module Helpers
  
  def escape(string)
    Rack::Utils.escape(string)
  end
  
end

AgnosticPresenters::Base.send :include, Helpers

# Model

Class.send :include, AgnosticPresenters::Helper

class Article
  attr_accessor :title, :body
  
  def initialize(title, body)
    @title, @body = title, body
  end
  
  presenters do
    
    def title
      escape(object.title)
    end
    
  end
end

describe Article do
  
  before(:all) do
    @article = Article.new("[Agnostic Presenters]", "New presenter plugin.")
  end
  
  it "should present title" do
    @article.title!.should_not == @article.title
    @article.title!.should == "%5BAgnostic+Presenters%5D"
  end
  
end