module HomeHelper
  def attachment_title(micropost)
    micropost.content.match(/(\w+?\s)++/)[0].strip
  end
end