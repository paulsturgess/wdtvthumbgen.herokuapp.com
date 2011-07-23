require 'rubygems'
require 'sinatra'
require 'mini_magick'

get '/' do
  erb :index
end

post '/' do
  if params[:image_url]
    image = MiniMagick::Image.open(params[:image_url])
    image.resize "120x180"
    image.resize "120x180!"
    send_file(image.path, :disposition => 'attachment', :filename => File.basename(params[:image_url]))
  end
end

