require 'rubygems'
require 'httparty'

class GitHub
  include HTTParty
  base_uri "https://github.com/api/v2/json"

  def initialize(repo, user="", pass="")
    @user = user
    @pass = pass
    @repo = repo
  end

  def label_issue(issue, label)
    options = @user.nil? ? {} : { :basic_auth => {:username => @user, :password => @pass}}
    self.class.post("/issues/label/add/#{@repo}/#{label}/#{issue}", options)
  end

  def self.issue(message)
    message[/gh-(\d+)/i,1]
  end

  def to_s
    "#{@repo} #{@user} #{@pass}"
  end
end