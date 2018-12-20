#!/usr/bin/env ruby
#
# Written by Naoya Niwa for report of IISEC lecture.

def encode_and_write(str, encoding)
  name = encoding.name
  encoded_str = str.encode(encoding)
  puts("%s: %d bytes" % [name, encoded_str.bytesize])
  File.open("dump_%s.txt" % name, "wb") do |f|
    f.print(encoded_str)
  end
  File.open("hexdump_%s.txt" % name, "wb") do |f|
    encoded_str.bytes.each do |byte|
      f.print(byte.to_s(16))
    end
  end
end

str = "iisecは、2019年1月26日に説明会を開催する。"
encode_and_write(str, Encoding::ISO_2022_JP)
encode_and_write(str, Encoding::Shift_JIS)
encode_and_write(str, Encoding::EUC_JP)
encode_and_write(str, Encoding::UTF_8)

