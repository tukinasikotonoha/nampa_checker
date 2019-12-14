module ApplicationHelper
  # ページごとの完全なタイトルを返します。
  def full_title(page_title: '', admin: true)
    base_title = if admin
                   'ナンパされチェッカー(管理画面)'
                 else
                   'ナンパされチェッカー'
                 end
    if page_title.empty?
      base_title
    else
      page_title + ' | ' + base_title
    end
  end

  def active_if(controller_name)
    'active' if controller_name == params[:controller]
  end
end
