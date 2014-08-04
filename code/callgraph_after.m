function [z] = f()
  mclab_callgraph_log('enter f@f.m:1,14\n');
  add = (@(x, y) mclab_callgraph_log_then_run('enter <lambda>@f.m:2,9\n', (@() (x + y))));
  three = mclab_callgraph_log_then_run('call add@f.m:3,11\n', add, 1, 2);
  z = (mclab_callgraph_log_then_run('call f@f.m:4,7\n', @f) + three);
end
