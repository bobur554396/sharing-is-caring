module SharesHelper

  def get_embed_link(passed_url)
    obj = $embedly_api.oembed(url: passed_url, maxwidth: 500)
  end

  def get_markdown_renderer
    $markdown
  end

end
