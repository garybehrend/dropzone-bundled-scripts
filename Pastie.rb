#!/usr/bin/ruby

# Dropzone Destination Info
# Name: Pastie
# Description: Sends the dropped text to the Pastie (pastie.org) service and puts the resulting URL on the pasteboard.
# Handles: NSStringPboardType
# Creator: Aptonic Software
# URL: http://aptonic.com
# IconURL: http://aptonic.com/destinations/icons/pastie.png

def dragged
  $dz.determinate("0")
  $dz.begin("Performing Paste...")

  pastie = Pastie::API.new
  url = pastie.paste($items[0], 'plain_text', false)

  $dz.finish("URL is now on clipboard")
  $dz.url(url)
end

def clicked
  system("open http://pastie.org/")
end