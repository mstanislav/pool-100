$:.unshift("/Library/RubyMotion/lib")
require 'motion/project'

Motion::Project::App.setup do |app|
  app.name = 'Pool 100'
  app.version = "1.7"
  app.deployment_target = '6.0'
  app.identifier = "com.pardalislabs.pool100"
  app.codesign_certificate = "iPhone Distribution: Pardalis Labs, LLC"
  app.provisioning_profile = "/Users/mstanislav/Library/MobileDevice/Provisioning\ Profiles/42A8F387-ACED-4130-ABD3-ED78957EEADD.mobileprovision"
  app.device_family = [:iphone]
  app.interface_orientations = [:portrait]
  app.icons = %w{Icon-20.png Icon-29.png Icon-57.png Icon-58.png Icon-114.png Icon-512.png Icon-1024.png}
  app.frameworks += ['CoreData','CoreImage']
end
