#--################################################################
# Copyright 2014, Alexander Serdobintsev <aserdobintsev@gmail.com>
#                                                            
# Distributed under the MIT license. 
#Permission is hereby granted, free of charge, to any person obtaining a copy
#of this software and associated documentation files (the "Software"), to deal
#in the Software without restriction, including without limitation the rights
#to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
#copies of the Software, and to permit persons to whom the Software is
#furnished to do so, subject to the following conditions:
#
#The above copyright notice and this permission notice shall be included in
#all copies or substantial portions of the Software.
#
#THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
#IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
#FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
#AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
#LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
#OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
#THE SOFTWARE.
#
##############################################################
require 'getoptlong'
require 'pathname'
#!/usr/bin/env ruby
#script_path is current script directory
script_path = File.expand_path(File.dirname(__FILE__))
RUBY = File.join(RbConfig::CONFIG['bindir'], RbConfig::CONFIG['ruby_install_name'])

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
# system("\"#{RUBY} -{script_path}/resign.rb\" --prov_profile_path \"#{prov_profile_path}\" --app_path \"#{app_path}\" --developerid \"#{dev_id}\"")
output = `#{RUBY} resign.rb --prov_profile_path \"#{prov_profile_path}\" --app_path \"#{app_path}\" --developerid \"#{dev_id}\"`
# output.split("\n").each do |line|
  # puts ""
# end