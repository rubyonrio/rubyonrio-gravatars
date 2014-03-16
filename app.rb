require 'sinatra'
require 'RMagick'
require 'open-uri'
include Magick

get '/image' do
  gravatars = [
    'de89dceb54a28b2aa952663cc94d60fc',
    'cd0c263b28fce0e1d89a0002cc75648b',
    '9742692d8f4eb9997301de35395e5460',
    'edd66843155ff2ee51f72b2d5487abea',
    'fddaed58a38748afdcd90bf7f0e02e17',
    '8f9968630845dc22fffdb581c54324e8',
    '0c55140c23bc76e128764feac26edb71',
    'b5213ca6d34dc9e13a8ef265d1835116',
    '4bf6b0cbd28f97183a2490671e257abf',
    '06e4c84000579d88c9298a6616a42e29'
  ]

  code = []
  image = Magick::ImageList.new

  gravatars.each do |gravatar|
    code << "<img src='http://www.gravatar.com/avatar/#{gravatar}' />"
    image.from_blob(open("http://www.gravatar.com/avatar/#{gravatar}").read)
  end

  image.montage{self.geometry = "+0+0"}.write("./generated_gravatars_montage.jpg")

  erb code.join('')
end
