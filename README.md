# QR Code Generator App: colorQR

This QR Code Generator is a simple web application built using Sinatra. It allows users to generate QR codes based on URLs they provide, with options to customize the color, background color, size, and filename of the QR code. The QR code is generated using the rqrcode gem and can be downloaded as a PNG file.
- CLI Version: For those interested in a command-line interface version of this application, you can find it on GitHub at [Qr Code Generator CLI](https://github.com/YoungSong99/Qr-Code-Generator).

## Demo
- Figma [design](https://www.figma.com/file/MFw3v4rhBt5kX93pMXWZYP/QR-Code-Generator-WireFrame?type=design&node-id=0%3A1&mode=design&t=YL12dBNLXASgHf0V-1)
- URL: [https://qr-code-generator-94io.onrender.com/](https://qr-code-generator-94io.onrender.com/)

## Features

- Generate QR codes from URLs.
- Customize QR code color and background color.
- Set the size of the QR code.
- Name and download the generated QR code as a PNG file.
- View a history of generated QR codes. Users can revisit and download previous QR codes anytime, which provides a convenient way to manage and reuse QR codes.

## Installation
1. Clone this repository:
   ```bash
   git clone https://github.com/YoungSong99/qr-code-website.git
   cd qr_code_generator
2. Install the required gems:
   ```bash
   bundle install
3. Run the application:
   ```bash
   ruby app.rb
