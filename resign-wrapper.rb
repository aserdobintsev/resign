#!/usr/bin/env ruby

#This script just help not to type name of identity during using ruby resign.rb ...

require 'getoptlong'
require 'pathname'

#script_path is current script directory
script_path = File.expand_path(File.dirname(__FILE__))

#dev_id is the name of the identity passed in
dev_id = "iPhone Distribution: Your Company Name (XXXXXXXXXX)"
#prov_profile_path is the posix path to the  provisioning profile
prov_profile_path=nil
#app_path is the posix path to the application bundle to sign
app_path=nil



#setup the options
opts = GetoptLong.new(
    [ '--prov_profile_path', '-p', GetoptLong::REQUIRED_ARGUMENT ],
    [ '--app_path', '-a', GetoptLong::REQUIRED_ARGUMENT ]
  )
  
opts.each do |opt, arg|
  case opt
    when '--prov_profile_path'
      prov_profile_path=arg
     when '--app_path'
        app_path = arg
  end
end

throw "file #{prov_profile_path} does not exist" if !File.exists?(prov_profile_path)
system("\"#{script_path}/resign.rb\" --prov_profile_path \"#{prov_profile_path}\" --app_path \"#{app_path}\" --developerid \"#{dev_id}\"")
