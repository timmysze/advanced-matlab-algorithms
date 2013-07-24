inputFile = fopen('data.txt', 'r');
outputFile = fopen('answer.txt', 'w');

[numCases] = fscanf(inputFile, '%g', [1,1]);

function row = calculateRow (index, cols)
  row = floor((index - 1)/cols) + 1;
endfunction

function col = calculateCol (index, cols)
  col = mod(index - 1, cols) + 1;
endfunction

function caseString = checkCase (lawn, m, n)
  rows = zeros(m, 1);
  cols = zeros(n, 1);

  for iterLawn = 1:numel(lawn)
    row = calculateRow(iterLawn, n);
    col = calculateCol(iterLawn, n);

    if lawn(iterLawn) > rows(row)
      rows(row) = lawn(iterLawn);
    endif
    if lawn(iterLawn) > cols(col)
      cols(col) = lawn(iterLawn);
    endif
  endfor

  % i think the rule is that can't be less than the max in two dimensions
  % the search for 'valleys'

  for iterLawn = 1:numel(lawn)
    row = calculateRow(iterLawn, n);
    col = calculateCol(iterLawn, n);

    if lawn(iterLawn) < rows(row) && lawn(iterLawn) < cols(col)
      caseString = 'NO';
      return;
    endif
  endfor

  caseString = 'YES';
endfunction

for iterCase = 1:numCases
  [dim] = fscanf(inputFile, '%g %g', [2, 1]);
  [lawn] = fscanf(inputFile, '%g', [dim(1), dim(2)]);

  string = checkCase(lawn, dim(1), dim(2));

  fprintf(outputFile, 'Case #%g: %s', iterCase, string);
  fprintf(outputFile, '\n');
endfor

fclose(inputFile);
fclose(outputFile);
