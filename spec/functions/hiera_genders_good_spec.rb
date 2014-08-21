require 'spec_helper'

item_unfound_msg = 'Could not find data item \w+ in any Hiera ' +
  'data file and no default supplied'

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

        it 'looks up a non-existent attribute and a default is returned' do
          should run.with_params('does_not_exist', 'default_value') \
            .and_return('default_value')
        end

        it 'looks up a non-existent attribute and an error is raised' do
          should run.with_params('does_not_exist') \
            .and_raise_error(Puppet::Error, /#{item_unfound_msg}/)
        end

      end

      context 'unknown hostname' do
        let(:facts) {{ :hostname => 'host_that_isnt' }}
        it 'looks up a variable and an error is raised' do
          should run.with_params('foo') \
            .and_raise_error(Puppet::Error, /#{item_unfound_msg}/)
        end
      end
    end
  end
end
