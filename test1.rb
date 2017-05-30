require "tegile-api"

#Request access info for array
#puts "IntelliFlash Array IP?:"
#host = gets.chomp
=begin
puts "IntelliFlash Array Username?:"
username = gets.chomp
puts "IntelliFlash Array Password?:"
password = gets.chomp
=end

host = "10.65.3.10"
username = "admin"
password = "premier1!north"

# Setup authorization
IFClient.configure do |config|
  # Configure HTTP basic authorization: basicAuth
  config.username = username
  config.password = password
  config.host = host
  config.verify_ssl = false
end
api_instance = IFClient::DataApi.new

begin
  #Lists all the pools on the Tegile array
  result = api_instance.list_pools_get
rescue IFClient::ApiError => e
  puts "Exception when calling DataApi->list_pools_get: #{e}"
end

#puts result

puts result[0].name
puts result[1].total_size


=begin

rescue ExceptionName

end

#Clean up result data
result.collect! { |e| e.to_s.delete!("{=,\s\"}") }
result.collect! { |e| e.to_s.gsub!(/:a/,'a') }
result.collect! { |e| e.to_s.gsub!(/>/,':') }
result.collect! { |e| e.to_s.downcase! }
result.collect! { |e| e.to_s.split(":") }

#Create hashes as needed
if result[0] != nil
  result_hash_0 = Hash[*result[0]]
end
if result[1] != nil
  result_hash_1 = Hash[*result[1]]
end
if result[2] != nil
  result_hash_2 = Hash[*result[2]]
end
if result[3] != nil
  result_hash_3 = Hash[*result[3]]
end

#Convert size values into TB
converted = result_hash_0["availablesize"].to_f/1024/1024/1024/1024
result_hash_0["availablesize"] = converted
converted = result_hash_0["totalsize"].to_f/1024/1024/1024/1024
result_hash_0["totalsize"] = converted

if result[1] != nil
  converted = result_hash_1["availablesize"].to_f/1024/1024/1024/1024
  result_hash_1["availablesize"] = converted
  converted = result_hash_1["totalsize"].to_f/1024/1024/1024/1024
  result_hash_1["totalsize"] = converted
end

#Return results in readable string
if result[0] != nil
  puts "Pool Name:#{result_hash_0["name"]}, Total Space:#{result_hash_0["totalsize"].floor(2)}TB, Avilable Space:#{result_hash_0["availablesize"].floor(2)}TB"
end

if result[1] != nil
  puts "Pool Name:#{result_hash_1["name"]}, Total Space:#{result_hash_1["totalsize"].floor(2)}TB, Avilable Space:#{result_hash_1["availablesize"].floor(2)}TB"
end
=end
