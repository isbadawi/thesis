function [] = for_each_file(root, extension, handler)
  _log('enter for_each_file@for_each_file.m:1,10');
  files = _log_then_run('call dir@for_each_file.m:2,11', @dir, root);
  for i = (1 : _log_then_run('call numel@for_each_file.m:3,13', @numel, files))
    file = _log_then_run('call files@for_each_file.m:4,12', files, i);
    if ((~_log_then_run('call is_in@for_each_file.m:5,9', @is_in, {'.', '..'}, file.name)) && file.isdir)
      _log_then_run('call for_each_file@for_each_file.m:6,7', @for_each_file, _log_then_run('call fullfile@for_each_file.m:6,21', @fullfile, root, file.name), extension, handler)
    elseif _log_then_run('call string_ends_with@for_each_file.m:7,12', @string_ends_with, extension, file.name)
      _log_then_run('call handler@for_each_file.m:8,7', handler, file)
    end
  end
end
function [b] = string_ends_with(suffix, s)
  _log('enter string_ends_with@for_each_file.m:13,14');
  b = (_log_then_run('call strfind@for_each_file.m:14,7', @strfind, s, suffix) == ((_log_then_run('call length@for_each_file.m:14,29', @length, s) - _log_then_run('call length@for_each_file.m:14,41', @length, suffix)) + 1));
end
function [b] = is_in(strings, string)
  _log('enter is_in@for_each_file.m:17,14');
  b = (~_log_then_run('call isempty@for_each_file.m:18,8', @isempty, _log_then_run('call find@for_each_file.m:18,16', @find, _log_then_run('call ismember@for_each_file.m:18,21', @ismember, strings, string))));
end
