class API < Grape::API
  prefix 'api'
  version 'v1', using: :path
  mount Account::Data
  mount Board::Data
end