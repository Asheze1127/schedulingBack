# spec/routing/routes_spec.rb
require 'rails_helper'

RSpec.describe 'Routing', type: :routing do
  it 'routes GET /up to rails/health#show' do
    expect(get: '/up').to route_to(controller: 'rails/health', action: 'show')
  end

  it 'routes POST /users to users#create' do
    expect(post: '/users').to route_to(controller: 'users', action: 'create')
  end

  it 'routes GET /users/:id to users#show' do
    expect(get: '/users/1').to route_to(controller: 'users', action: 'show', id: '1')
  end

  it 'routes GET /users/:user_id/plans to plans#index' do
    expect(get: '/users/1/plans').to route_to(controller: 'plans', action: 'index', user_id: '1')
  end

  it 'routes GET /users/:user_id/plans/:id to plans#show' do
    expect(get: '/users/1/plans/2').to route_to(controller: 'plans', action: 'show', user_id: '1', id: '2')
  end

  it 'routes POST /users/:user_id/plans to plans#create' do
    expect(post: '/users/1/plans').to route_to(controller: 'plans', action: 'create', user_id: '1')
  end

  it 'routes PATCH /users/:user_id/plans/:id to plans#update' do
    expect(patch: '/users/1/plans/2').to route_to(controller: 'plans', action: 'update', user_id: '1', id: '2')
  end

  it 'routes PUT /users/:user_id/plans/:id to plans#update' do
    expect(put: '/users/1/plans/2').to route_to(controller: 'plans', action: 'update', user_id: '1', id: '2')
  end

  it 'routes DELETE /users/:user_id/plans/:id to plans#destroy' do
    expect(delete: '/users/1/plans/2').to route_to(controller: 'plans', action: 'destroy', user_id: '1', id: '2')
  end

  # rswagのマウントパスはengineなのでroutingテストでは基本不要ですが、必要なら以下のように書けます
  #it 'routes /api-docs to Rswag UI and API engines' do
  #  expect(get: '/api-docs').to route_to('rswag/ui/engine#call') # ただしmountの動作は特殊なので実際はengine内で処理される
  #end
end
