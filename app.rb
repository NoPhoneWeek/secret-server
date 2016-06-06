require "sinatra"
require "securerandom"

set :port, 9149

whitelist = File.read("whitelist").split(/\r?\n/).reject{|line| line.start_with? '#'}
blacklist = File.read("blacklist").split(/\r?\n/).reject{|line| line.start_with? '#'}

current_secret = SecureRandom.base64

before do
  addr = request.ip
  if blacklist.include? addr or ! whitelist.include? addr
    puts "Unauthorized connection from #{addr}"
    halt 403
  end
end

get "/" do redirect "/secret" end

get "/secret" do
  current_secret
end

get "/change" do
  current_secret = SecureRandom.base64  
end

get "/reload" do
  whitelist = File.read("whitelist").split(/\r?\n/).reject{|line| line.start_with? '#'}
  blacklist = File.read("blacklist").split(/\r?\n/).reject{|line| line.start_with? '#'}
end

