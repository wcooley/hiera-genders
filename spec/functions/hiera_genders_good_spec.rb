require 'spec_helper'

describe 'hiera' do
  context 'hiera-genders backend' do
    context 'good genders file' do
      let(:hiera_config) { 'spec/fixtures/hiera/good/hiera.yaml' }

      context 'basic lookups' do
        let(:facts) {{ :hostname => 'host1' }}

        it 'looks up an attribute with value and gets expected value' do
          should run.with_params('foo').and_return('bar')
        end

        it 'looks up a valueless attribute and gets true' do
          should run.with_params('oof').and_return(true)
        end

        it 'looks up a non-existent attribute and gets false' do
          should run.with_params('does_not_exist').and_return(false)
        end
      end

      context 'unknown hostname' do
        let(:facts) {{ :hostname => 'host_that_isnt' }}
        it 'looks up a variable and gets false' do
          should run.with_params('foo').and_return(false)
        end
      end
    end
  end
end
