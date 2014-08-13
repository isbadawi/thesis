function code_size
  total_size = 0;
  function add_size(file)
    total_size = total_size + file.bytes;
  end

  for_each_file('.', '.m', @add_size);
  disp(total_size);
end