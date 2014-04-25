require 'mkmf'

paths = Dir.glob('/opt/vasco/VACMAN_Controller-*').sort.reverse
found = false
if path.any? && version = paths.first().(/VACMAN_Controller\-(.*)$/)[1]
  if find_library("aal2sdk-#{version}", 'AAL2DPXInit', "/opt/vasco/VACMAN_Controller-#{version}/lib")
    found = true
    create_makefile('vacman_controller/vacman_controller')
  end
end

unless found
  puts "No libaal2sdk found"
  exit 1
end