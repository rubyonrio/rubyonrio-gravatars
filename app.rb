require 'sinatra'

get '/image' do
  gravatars = ['de89dceb54a28b2aa952663cc94d60fc', 'cd0c263b28fce0e1d89a0002cc75648b', '9742692d8f4eb9997301de35395e5460']
  code = []
  gravatars.each do |gravatar|
    code << "<img src='http://www.gravatar.com/avatar/#{gravatar}'/>"
  end

  erb code.join('')
end
