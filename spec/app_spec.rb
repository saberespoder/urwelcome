require 'spec_helper'

RSpec.describe URWelcome do
  describe 'POST signup' do
    subject { post '/signup', params }

    context 'valid params' do
      let(:params) do
        {
          name: 'Alessio',
          email: 'test@saberespoder.com'
        }
      end

      it 'returns empty 200 response' do
        subject
        expect(last_response.body).to eq("")
        expect(last_response.status).to eq 200
      end

      it 'creates user' do
        expect { subject }.to change(Member, :count).by(1)
      end
    end
  end
end
