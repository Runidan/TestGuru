# frozen_string_literal: true

module ApplicationHelper
  def current_year
    DateTime.current.year
  end

  def github_url(author, repo)
    link_to 'Repository on GitHub', "https://github.com/#{author}/#{repo}", target: '_blank', rel: 'noopener', class: 'text-decoration-none'
  end

  def flash_message(type)
    style_alert = type == "notice" ? "alert alert-success" : "alert alert-danger" 
    content_tag :div, flash[type], class: style_alert, role: "alert" if flash[type]
  end
end
