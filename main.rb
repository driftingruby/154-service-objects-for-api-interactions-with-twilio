require 'dotenv/load'
require_relative 'services/send_sms'

puts "Enter Phone Number"
number = gets.chomp!

puts "Enter Message"
message = gets.chomp!

request = Services::SendSms.call(number, message)

if request.success?
  puts 'Message sent successfully'
elsif request.failure?
  puts request.errors
end

puts request.success?
puts request.result
puts request.result.result.class

