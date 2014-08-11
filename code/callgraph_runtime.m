function mclab_callgraph_init(logfile)
  global fid
  fid = fopen(logfile, 'a');
end

function mclab_callgraph_log(s)
  global fid;
  fprintf(fid, '%s\n', s);
end

function varargout = mclab_callgraph_log_then_run(s, f, varargin)
  if isa(f, 'function_handle')
    mclab_callgraph_log(s);
  end
  [varargout{1:nargout}] = f(varargin{:});
end
