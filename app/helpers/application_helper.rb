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

  def default_meta_tags
    {
        # site: 'ナンパされチェッカー',
        # title: 'アナタの「女装姿」はナンパされるか？',
        reverse: true,
        charset: 'utf-8',
        description: 'アナタの女装姿が「女性に見えるのか」を検証できる顔認証アプリケーション「ナンパされチェッカー」です。',
        keywords: '女装,ナンパ',
        canonical: request.original_url,
        separator: '|',
        icon: [
            { href: image_url('favicon.ico') },
            { href: image_url('icon-192x192.png'), rel: 'apple-touch-icon', sizes: '180x180', type: 'image/jpg' },
        ],
        og: {
            # site_name: 'ナンパされチェッカー', # もしくは site_name: :site
            # title: 'アナタの「女装姿」はナンパされるか？', # もしくは title: :title
            description: 'アナタの女装姿が「女性に見えるのか」を検証できる顔認証アプリケーション「ナンパされチェッカー」です。', # もしくは description: :description
            type: 'website',
            url: request.original_url,
            image: image_url('top.jpg'),
            locale: 'ja_JP',
        },
        twitter: {
            card: 'summary_large_image',
            site: '@tukinasikotonoh',
        }
    }
  end
end
