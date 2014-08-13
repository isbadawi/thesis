function for_each_file(root, extension, handler)
  files = dir(root);
  for i = 1:numel(files)
    file = files(i);
    if ~is_in({'.', '..'}, file.name) && file.isdir
      for_each_file(fullfile(root, file.name), extension, handler)
    elseif string_ends_with(extension, file.name)
      handler(file)
    end
  end
end

function b = string_ends_with(suffix, s)
  b = strfind(s, suffix) == length(s) - length(suffix) + 1;
end

function b = is_in(strings, string)
  b = ~isempty(find(ismember(strings, string)));
end