function olfcn(url, file_name, overwrite)
    %{
    Url given, download the source code.
    %}
    if nargin < 2 || ~file_name
        sep = split(url, '/');
        file_name = sep{end};
    end
    if nargin < 3
        overwrite = false;
    end
    text = webread(url);
    if exist(file_name, 'file')
        if ~overwrite
            fprintf('%s exists\n', file_name);
        end
    else
        f = fopen(file_name, 'wt');
        fprintf(f, '%s', text);
        fclose(f);
    end
end
