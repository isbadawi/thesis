function [] = code_size()
  _log('enter code_size@code_size.m:1,10');
  total_size = 0;
  _log_then_run('call for_each_file@code_size.m:7,3', @for_each_file, '.', '.m', @add_size);
  _log_then_run('call disp@code_size.m:8,3', @disp, total_size);
  function [] = add_size(file)
    _log('enter add_size@code_size.m:3,12');
    total_size = (total_size + file.bytes);
  end
end
