function data_cell = convert_to_cell(stacked_data)
% Write your function here
data_cell = num2cell(stacked_data, [3 2]);
data_cell = cellfun(@(x) reshape(x,[],128),data_cell,'UniformOutput',false);

end

