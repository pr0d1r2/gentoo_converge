include_recipe 'gentoo-support::portage_defaults'

execute_once 'emerge -C gperf' do
  only_if { File.exist?('/usr/bin/gperf') }
  not_if { File.exist?('/usr/bin/pscap') }
end

package 'sys-libs/libcap'

execute_once 'emerge gperf' do
  not_if { File.exist?('/usr/bin/gperf') || File.exist?('/usr/bin/pscap') }
end
