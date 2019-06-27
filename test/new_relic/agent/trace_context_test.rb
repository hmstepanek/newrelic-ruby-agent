# encoding: utf-8
# This file is distributed under New Relic's license terms.
# See https://github.com/newrelic/rpm/blob/master/LICENSE for complete details.

require File.expand_path '../../../test_helper', __FILE__
require 'new_relic/agent/trace_context'

module NewRelic
  module Agent
    class TraceContextTest < Minitest::Test
      def test_insert
        carrier = {}
        trace_id = 'a8e67265afe2773a3c611b94306ee5c2'
        parent_id = 'fb1010463ea28a38'
        trace_flags = 0x1
        trace_state = 'k1=asdf,k2=qwerty'

        TraceContext.insert carrier: carrier,
                            trace_id: trace_id,
                            parent_id: parent_id,
                            trace_flags: trace_flags,
                            trace_state: trace_state

        assert_equal "00-#{trace_id}-#{parent_id}-01", carrier['traceparent']
        assert_equal trace_state, carrier['tracestate']
      end
    end
  end
end
