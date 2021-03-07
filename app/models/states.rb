class States < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: 'S' },
    { id: 3, name: 'A' },
    { id: 4, name: 'B' },
    { id: 5, name: 'C' },
    { id: 6, name: 'D' },
    { id: 7, name: 'E' }
  ]

  include ActiveHash::Associations
  has_many :items
end
