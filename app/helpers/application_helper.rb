# frozen_string_literal: true

module ApplicationHelper
  def current_year
    DateTime.current.year
  end

  def github_url(author, repo)
    link_to 'Repository on GitHub', "https://github.com/#{author}/#{repo}", target: '_blank', rel: 'noopener'
  end

  def flash_message(type)
    content_tag :div, flash[type], class: "flash #{type}" if flash[type]
  end
end
