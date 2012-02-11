xml.krpano :version => '1.0' do
	xml.view :fovtype => 'HFOV', :vlookat => '-4', :fov => '120', :fovmin => '70', :fovmax => '140' 
	xml.image :type => 'CUBESTRIP' do
		xml.cubestrip :url => @proper.photo.url 
		xml.left :strip => '1' 
		xml.front :strip => '2' 
		xml.right :strip => '3' 
		xml.back :strip => '4' 
		xml.up :strip => '5' 
		xml.down :strip => '6' 
	end
end
