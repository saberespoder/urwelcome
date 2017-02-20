require 'spec_helper'

describe Member do
  let(:params) do
    {
      name: 'Alessio',
      email: 'alessio@saberespoder.com'
    }
  end

  it { expect { Member.create(params) }.to change(Member, :count).by(1) }

  it 'uses UUID as primary key' do
    expect(Member.last.uuid).to match /(\w{8}(-\w{4}){3}-\w{12}?)/
  end

  it 'has timestamps' do
    expect(Member.last.created_at).to be_truthy
  end
end
