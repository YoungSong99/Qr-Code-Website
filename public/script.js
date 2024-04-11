document.getElementById('generateBtn').addEventListener('click', function() {
  var url = document.getElementById('url').value;
  if (!url) {
      alert('Please enter a URL');
      return;
  }
  console.log('Generating QR Code for URL:', url);
});
