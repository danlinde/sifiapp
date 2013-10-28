def example_image_path
	Rails.root.join('spec/images/birthday_cake.jpg')
end

def example_image
	example_image_path.open
end