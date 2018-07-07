system('touch /etc/portage/package.use/default')
system('touch /etc/portage/package.mask/default')

{
  'USE="bindist' => 'USE="-bindist',
  ' bindist ' => ' -bindist ',
  ' bindist"' => ' -bindist"'
}.each do |from_string, to_string|
  search_and_replace '/etc/portage/make.conf' do
    from from_string
    to to_string
  end
end

package 'eix'
execute_today 'eix-update'

execute 'emerge `eix --installed-with-use bindist | grep "^\[I\]" | cut -f 2 -d " " | tac | tr "\n" " "`' do
  only_if { system('eix --installed-with-use bindist | grep "^\[I\]" | grep -q "[a-z]"') }
end
