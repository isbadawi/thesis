aspect callgraph
  patterns
    function_call : call(*)
    function_enter : execution(*)
  end

  actions
    log_call : before function_call : (name, file, line, col)
      mclab_callgraph_log(sprintf('call %s@%s:%d,%d', name, file, line, col))
    end

    log_enter : before function_enter (name, file, line, col)
      mclab_callgraph_log(sprintf('enter %s@%s:%d,%d', name, file, line, col))
    end
  end
end
