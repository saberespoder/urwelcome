require 'spec_helper'

describe Member do
  let(:params) do
    {
      name: 'Alessio',
      email: 'alessio@saberespoder.com'
    }
  end

  it { expect(Member.create(params)).to change(Member, :count).by(1) }
  it { expect(Member.create({})).to_not change(Member, :count) }
end
