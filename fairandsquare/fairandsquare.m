inputFile = fopen('data.txt', 'r');
outputFile = fopen('answer.txt', 'w');

[numCases] = fscanf(inputFile, '%g', [1,1]);

function isPali = checkPalindrome (number)
  
endfunction

function palindromes = buildPalindromes (a, b)
  % 9
  % 22
  % 33
  % 44
  % 55
  % 99
  % 101
  % 111
  % 121
  % 999
  % 1001
  % 1111
  % 1991
  % 2002
  % 9999
  % 10001
endfunction

function caseString = checkCase (l, u)
  myLower = ceil(sqrt(l));
  counter = 0;

  while myLower^2 <= u
    % check something
    if checkPalindrome(myLower) == 'yes'
      if checkPalindrome(myLower^2) == 'yes'
        counter++;
      endif
    endif
    myLower++;
  endwhile
  % then loop through palindromes and square them st the ans is less than upper
  % and if ans is a palindrome
    % increment the counter

  % how do find palidromes?
    % write a function that checks if a num is a palindrome

endfunction

for iterCase = 1:numCases
  [range] = fscanf(inputFile, '%g', [1,2]);

  string = checkCase(range(1), range(2));

  fprintf(outputFile, 'Case #%g: %s', iterCase, string);
  fprintf(outputFile, '\n');
endfor

fclose(inputFile);
fclose(outputFile);
