function clean_dynare_output(filename)

delete *.eps;
delete(strcat(filename, '_results.mat'));
delete(strcat(filename, '.log'));
delete(strcat(filename, '.m'));
delete(strcat(filename, '_static.m'));
delete(strcat(filename, '_dynamic.m'));
delete(strcat(filename, '_set_auxiliary_variables.m'));
rmdir(filename, 's');
%rmdir(strcat('+', filename));

end