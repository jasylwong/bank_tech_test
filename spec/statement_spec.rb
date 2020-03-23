require 'spec_helper'

describe 'Statement' do
  let(:statement) { Statement.new }

  it 'allows creation of a new statement' do
    expect(statement.instance_of? Statement).to eq(true)
  end
end