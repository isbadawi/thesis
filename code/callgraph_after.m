function [z] = f()
  mclab_callgraph_log('enter f@f.m:1,1\n');
  x = mclab_callgraph_log_then_run('call compute_x@f.m:2,7\n', @compute_x, 1, mclab_callgraph_log_then_run('call other_call@f.m:2,20\n', @other_call))
  y = mclab_callgraph_log_then_run('call compute_y@f.m:3,7\n', @compute_y)
  z = (x + y)
end
