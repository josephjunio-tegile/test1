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

host = "10.65.5.222"
username = "admin"
password = "tegile"

# Setup authorization
IFClient.configure do |config|
  # Configure HTTP basic authorization: basicAuth
  config.username = username
  config.password = password
  config.host = host
  config.verify_ssl = false
end

vol1 = IFClient::VolumeV10.new
vol1.name = "vol5"
vol1.pool_name = "pool-a"
vol1.project_name = "test2"
vol1.protocol = "iSCSI"
vol1.vol_size = 10737418240
vol1.block_size = IFClient::BlockSizeEnum::N16_KB
vol1.thin_provision = true
vol1.local = true

puts IFClient::COMMANDSTATUS::COMMAND_SUCCEED

api_instance = IFClient::DataApi.new

create_volume_param = IFClient::CreateVolumeParam.new # CreateVolumeParam |
create_volume_param.arg0_volume = vol1
create_volume_param.arg1_inherit_san_view_settings_from_project = true

=begin
  #Creates a volume with the specified settings.
  result = api_instance.create_volume_post(create_volume_param)
  if result == COMMANDSTATUS::COMMAND_SUCCEED
    puts "Succed"
  end
  puts result
rescue IFClient::ApiError => e
  puts "Exception when calling DataApi->create_volume_post: #{e}"
=end
