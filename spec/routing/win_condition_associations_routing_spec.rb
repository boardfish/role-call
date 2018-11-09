# frozen_string_literal: true

require 'rails_helper'

RSpec.describe WinConditionAssociationsController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/win_condition_associations').to route_to('win_condition_associations#index')
    end

    it 'routes to #new' do
      expect(get: '/win_condition_associations/new').to route_to('win_condition_associations#new')
    end

    it 'routes to #show' do
      expect(get: '/win_condition_associations/1').to route_to('win_condition_associations#show', id: '1')
    end

    it 'routes to #edit' do
      expect(get: '/win_condition_associations/1/edit').to route_to('win_condition_associations#edit', id: '1')
    end

    it 'routes to #create' do
      expect(post: '/win_condition_associations').to route_to('win_condition_associations#create')
    end

    it 'routes to #update via PUT' do
      expect(put: '/win_condition_associations/1').to route_to('win_condition_associations#update', id: '1')
    end

    it 'routes to #update via PATCH' do
      expect(patch: '/win_condition_associations/1').to route_to('win_condition_associations#update', id: '1')
    end

    it 'routes to #destroy' do
      expect(delete: '/win_condition_associations/1').to route_to('win_condition_associations#destroy', id: '1')
    end
  end
end
