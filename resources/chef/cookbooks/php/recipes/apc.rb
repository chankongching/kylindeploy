# Copyright 2009-2011, Opscode, Inc.
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
#

#execute "apc" do
#   command "printf '\n' | pecl install apc"
#   action :run
#   ignore_failure true
#end

package "php-pecl-apc" do
  action :install
end

template "/etc/php.d/apc.ini" do
        source "apc.ini"
        path "/etc/php.d/apc.ini"
        mode 0644
        owner "root"
        group "root"
end