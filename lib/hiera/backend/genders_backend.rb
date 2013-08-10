#
# Copyright (C)2013 Will (Wil) Cooley
#
#   Licensed under the Apache License, Version 2.0 (the "License");
#   you may not use this file except in compliance with the License.
#   You may obtain a copy of the License at
#
#       http://www.apache.org/licenses/LICENSE-2.0
#
#   Unless required by applicable law or agreed to in writing, software
#   distributed under the License is distributed on an "AS IS" BASIS,
#   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#   See the License for the specific language governing permissions and
#   limitations under the License.
#
#
#
class Hiera
  module Backend
    class Genders_backend

      def initialize
        Hiera.debug('component=Genders_backend status=initialized')

      end

      def lookup(key, scope, order_override, resolution_type)
        Hiera.debug("function=lookup key=\"#{key}\"" \
                    + " resolution_type=\"#{resolution_type}\"")

        # We only support priority resolution currently
        return if resolution_type != :priority

        if Config[:genders]
          Hiera.debug("Config[:genders]=\"#{Config[:genders]}\"")
          nodeattr_param = Backend.parse_string(Config[:genders][:file], scope)
          nodeattr_param = "-f '#{nodeattr_param}'"
        end

        Hiera.debug("nodeattr_param=\"#{nodeattr_param}\"")

        validate_genders(nodeattr_param)

        cmd = "nodeattr #{nodeattr_param} -v #{scope['hostname']} #{key} 2>&1"

        Hiera.debug("function=lookup cmd=\"#{cmd}\"")

        result = `#{cmd}`.chomp
        return_code = $?

        Hiera.debug("nodeattr_result=\"#{result}\" return=\"#{return_code}\"")

        if return_code != 0       # Attribute does not exist
          return false
        elsif result.length == 0  # Attribute exists but is non-valued
          return true
        else                      # Attribute exists and has value
          return result
        end
      end

      def validate_genders(nodeattr_param)

        cmd="nodeattr -k #{nodeattr_param} 2>&1"

        Hiera.debug("function=validate_genders cmd=\"#{cmd}\"")

        # Ensure that the genders file is there and parses
        result = `#{cmd}`.chomp
        return_code = $?

        Hiera.debug("nodeattr_result=\"#{result}\" return=\"#{return_code}\"")

        # We want to fail hard if there is an error reading or parsing genders;
        # otherwise a host that requires something more specific might end up
        # with an undesirable default
        if return_code != 0
          raise Exception, "Error with genders file: #{result}" 
        end

      end

    end
  end
end
