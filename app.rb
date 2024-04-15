require 'sinatra'
require 'sinatra/reloader'
require 'rqrcode'
require 'chunky_png'
require "sinatra/cookies"
require 'cgi'


# Main route for the form
get "/" do
  @url = params['url']
  @code_color = params['codeColor']
  @background_color = params['backgroundColor']
  @size = params['size']
  @file_name = params['fileName']
  erb :qrform, layout: :layout
end

# Route to handle form submission and generate QR code
post "/generate" do
  content_type 'image/png'

  # Extract form data
  url = params['url']
  code_color = params['codeColor'] || 'black'
  background_color = params['backgroundColor'] || 'white'
  size = params['size'] ? params['size'].to_i : 300
  file_name = params['fileName'] || 'qr_code'

  # Validate and generate QR code
  if url && !url.empty?
    qr = RQRCode::QRCode.new(url)

    # Convert to PNG
    png = qr.as_png(
      bit_depth: 1,
      border_modules: 4,
      color_mode: ChunkyPNG::COLOR_GRAYSCALE,
      color: code_color,
      file: nil, # Not writing to file directly
      fill: background_color,
      module_px_size: size,
      resize_exactly_to: false,
      resize_gte_to: false,
      size: size
    )
    response.headers['Content-Disposition'] = "attachment; filename=#{file_name}.png"
    
    # Save to cookies
    history = (cookies[:history] ? JSON.parse(cookies[:history]) : [])
    history.push({url: url, code_color: code_color, background_color: background_color, size: size, file_name: file_name})
    cookies[:history] = JSON.generate(history)
    
    png.to_s
  else
    halt 400, "URL is required"
  end
end


get "/history" do
  @history = cookies[:history] ? JSON.parse(cookies[:history]) : []
  erb :history
end
