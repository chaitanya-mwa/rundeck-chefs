# Copyright 2012, Tim Smith - Webtrends Inc
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

#Exit the recipe if system's manufacturer as detected by ohai does not match "Dell"
if !node[:dmi][:system][:manufacturer].include? 'Dell' && !node[:kernel][:modules][:megaraid_sas].exists? then
	return
end

# Install the megaraid cli with --nodeps since LSI makes bad packages
package "MegaCli" do
  action :install
  source node[:delltools][:megaraid][:megacli_url]
  option "--nodeps"
end