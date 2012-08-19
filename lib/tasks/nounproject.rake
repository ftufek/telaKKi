namespace :nounproject do
  desc "Get new icon from NounProjects website"
  task :new, :icon_no, :icon_name do |t, args|
    puts "Getting icon: #{args[:icon_no]} as #{args[:icon_name]}"
    sh "cd tmp/; 
        wget -v http://thenounproject.com/download/zipped/svg_#{args[:icon_no]}.zip; 
        unzip -o svg_#{args[:icon_no]}.zip;
        rm -rf svg_#{args[:icon_no]}.zip;
        cd ..;
        mv tmp/noun_project_#{args[:icon_no]}.svg app/assets/images/icon/#{args[:icon_name]}.svg"
  end
end
