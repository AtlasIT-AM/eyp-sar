require 'spec_helper_acceptance'
require_relative './version.rb'

describe 'sar class' do

  context 'basic setup' do
    # Using puppet_apply as a helper
    it 'should work with no errors' do
      pp = <<-EOF

      class { 'sar':
      }

      EOF

      # Run it twice and test for idempotency
      expect(apply_manifest(pp).exit_code).to_not eq(1)
      expect(apply_manifest(pp).exit_code).to eq(0)
    end

    describe file($sysstatconf) do
      it { should be_file }
      its(:content) { should match 'puppet managed file' }
      its(:content) { should match 'HISTORY=30' }
    end

  end
end
