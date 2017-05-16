$("#ajax_params_inspector_update_div").append("<%= "[#{Time.current}][#{request.method}]" + j(params.to_unsafe_h.inspect) %><br/>")
