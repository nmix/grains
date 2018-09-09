require 'rails_helper'

# https://github.com/collectiveidea/interactor#testing-interactors
describe CurrentTime do
  subject(:context) { CurrentTime.call }

  describe '.call' do
    it 'successed' do
      expect(context).to be_a_success
    end
  end
end
