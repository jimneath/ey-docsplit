# send message to dashboard
ey_cloud_report do
  message "install docsplit and prerequisites"
end

# prerequisite packages
packages = {
  'media-gfx/graphicsmagick' => '~1.3.5',
  'app-text/poppler' => '~0.10.0',
  'app-text/poppler-data' => '0.2.0',
  'app-text/tesseract' => '~3.02',
  'app-text/pdftk-bin' => '~1.44',
  'app-office/libreoffice-bin' => '~3.3.0-r1'
}

# install all prerequisites
packages.each do |package, version|
  # unmask package if needed
  if version[/^~/]
    version = version[/[^~]+$/]
    enable_package(package) do
      version(version)
    end
  end
  
  # install package
  package(package) do
    version(version)
  end
end

# install the docsplit gem
execute "install-docsplit-gem" do
  command "gem install docsplit"
end