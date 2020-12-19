class Vaccine < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: '接種済' },
    { id: 3, name: '未接種' }
  ]
end
