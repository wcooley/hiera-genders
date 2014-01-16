require 'spec_helper'

describe 'hiera' do
  context 'hiera-genders backend' do
    context 'broken genders file' do
      let(:hiera_config) { 'spec/fixtures/hiera/broken/hiera.yaml' }
      let(:facts) {{ :hostname => 'host1' }}
      it 'fails as expected with broken genders file' do
        expect {
          should run.with_params('whatever')
        }.to raise_error(Exception, /Error with genders file/)
      end
    end
  end
end
