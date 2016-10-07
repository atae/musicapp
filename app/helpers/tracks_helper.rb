module TracksHelper
  include ERB::Util
  def ugly_lyrics(lyrics)
    parsed = lyrics.split("\r\n")
    html = ""
    parsed.each do |line|
      if line.length <= 1
        html += "\r\n"
      else
        html += "&#9835;#{h(line)}\r\n".html_safe
      end
    end
    "<pre>#{html}</pre>".html_safe
  end
end
