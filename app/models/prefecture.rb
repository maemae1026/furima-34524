class Prefecture < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: '東京都' },
    { id: 3, name: '神奈川県' },
    { id: 4, name: '埼玉県' },
    { id: 5, name: '千葉県' },
    { id: 6, name: '茨城県' },
    { id: 7, name: '山梨県' },
    { id: 8, name: '群馬県' },
    { id: 9, name: '静岡県' },
    { id: 10, name: 'その他' }
  ]

  include ActiveHash::Associations
  has_many :items
  end