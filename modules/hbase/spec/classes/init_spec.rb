require 'spec_helper'
describe 'hbase' do

  context 'with defaults for all parameters' do
    it { should contain_class('hbase') }
  end
end
